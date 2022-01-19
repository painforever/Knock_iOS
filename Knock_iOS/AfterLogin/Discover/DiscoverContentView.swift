//
//  DiscoverContentView.swift
//  Knock_iOS
//
//  Created by yusong on 10/28/21.
//

import SwiftUI
import Alamofire
import SwiftyJSON

extension DiscoverContentView {
    class DiscoverViewModel: ObservableObject {
        @Published var data: [Person] = []
    }
}

struct DiscoverContentView: View {
    @State var searchTerm: String = ""
    @State var isProfilePresented = false
    @State var showFilterPeopleContentView = false
    @StateObject var locationManager = LocationManager()
    @StateObject var viewModel = DiscoverViewModel()
    @StateObject var filterPeopleViewModel: FilterPeopleViewModel = FilterPeopleViewModel()
    
    var body: some View {
        LoadingView(isShowing: $filterPeopleViewModel.isLoading, text: "Searcing...") {
            NavigationView {
                ZStack {
                    Rectangle().fill(Color(Constants.themeColor)).ignoresSafeArea()
                    VStack {
                        HStack {
                            Text("Discover").font(.system(size: 50, weight: .heavy)).foregroundColor(.white)
                            Spacer()
                        }.padding(.horizontal, 20)
                        
                        HStack(alignment: .center, spacing: 10) {
                            TextField("People or fields you are interested...", text: $searchTerm).padding().overlay(RoundedRectangle(cornerRadius: 5).stroke(Color.white, lineWidth: 1)).foregroundColor(.white).padding()
                            Button(action: {
                                self.showFilterPeopleContentView = true
                            }, label: {
                                Image(systemName: "slider.horizontal.3").font(.system(size: 25, weight: .regular)).foregroundColor(.white)
                            }).sheet(isPresented: $showFilterPeopleContentView) {
                                FilterPeopleContentView(locationManager: locationManager, filterPeopleViewModel: filterPeopleViewModel)
                            }
                            Button(action: {
                                searchPeople()
                            }, label: {
                                Image(systemName: "magnifyingglass").font(.system(size: 25, weight: .regular)).foregroundColor(.white)
                            }).padding(.trailing, 20)
                        }
                        
                        List {
                            ForEach(self.$viewModel.data) { user in
                                DiscoverPeopleCardContentView(person: user, bgImage: .constant(Constants.discoverPeopleCard1))
                                    .onTapGesture {
                                        isProfilePresented = true
                                    }
                                    .fullScreenCover(isPresented: $isProfilePresented) {
                                    
                                    } content: {
                                        ProfileContentView(username: user.username)
                                    }

                            }
                        }
                        .frame(width: UIScreen.main.bounds.size.width, alignment: .center)
                        .listRowInsets(.init())
                        .listStyle(PlainListStyle())
                        //.frame(maxWidth: .infinity)
                    }
                }.onChange(of: self.locationManager.lastLocation) { newValue in
                    loadData()
                }.onAppear {
                    //UserDefaults.standard.removeObject(forKey: Constants.userId)
                    loadData()
                }
            }
        }
        
    }
    
    func loadData() {
        filterPeopleViewModel.isLoading = true
        if let user_id = UserDefaults.standard.string(forKey: Constants.userId), let lat = self.locationManager.lastLocation?.coordinate.latitude, let lon = self.locationManager.lastLocation?.coordinate.longitude {
            
            AF.request("\(Constants.BaseUrl)/discovers/index", method: .get, parameters: ["user_id": user_id, "lat": lat, "lon": lon]).responseData { data in
                let json = try! JSON(data: data.data!)
                viewModel.data = []
                for user in json {
                    let userValue = user.1["user"].dictionaryValue
                    let distanceValue = user.1["distance"].stringValue
                    let dnas = user.1["dnas"].arrayValue.map { $0.stringValue }
                    
                    self.viewModel.data.append(
                        Person(
                            username: userValue["username"]!.stringValue,
                            city: userValue["city"]!.stringValue,
                            price: userValue["meeting_rate"]!.stringValue,
                            occupation: userValue["occupation"]!.stringValue,
                            locationAcceptedDistance: distanceValue,
                            dnas: dnas.joined(separator: ","),
                            s3AvatarPhoto: userValue["s3_avatar_photo"]!["url"].stringValue
                        )
                    )
                }
                filterPeopleViewModel.isLoading = false
            }
        }
    }
    
    func searchPeople() {
        filterPeopleViewModel.isLoading = true
        if let user_id = UserDefaults.standard.string(forKey: Constants.userId), let lat = self.locationManager.lastLocation?.coordinate.latitude, let lon = self.locationManager.lastLocation?.coordinate.longitude {
            AF.request("\(Constants.BaseUrl)/discovers/search_people", method: .get, parameters: ["user_id": user_id, "term": searchTerm, "lat": lat, "lon": lon]).responseData { data in
                let json = try! JSON(data: data.data!)
                viewModel.data = []
                for user in json {
                    let userValue = user.1["user"].dictionaryValue
                    let distanceValue = user.1["distance"].stringValue
                    let dnas = user.1["dnas"].arrayValue.map { $0.stringValue }
                    
                    self.viewModel.data.append(
                        Person(
                            username: userValue["username"]!.stringValue,
                            city: userValue["city"]!.stringValue,
                            price: userValue["meeting_rate"]!.stringValue,
                            occupation: userValue["occupation"]!.stringValue,
                            locationAcceptedDistance: distanceValue,
                            dnas: dnas.joined(separator: ","),
                            s3AvatarPhoto: userValue["s3_avatar_photo"]!["url"].stringValue
                        )
                    )
                }
                filterPeopleViewModel.isLoading = false
            }
        }
    }
}

struct DiscoverContentView_Previews: PreviewProvider {
    static var previews: some View {
        DiscoverContentView()
    }
}
