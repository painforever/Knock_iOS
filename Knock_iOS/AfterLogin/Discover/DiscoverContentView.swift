//
//  DiscoverContentView.swift
//  Knock_iOS
//
//  Created by yusong on 10/28/21.
//

import SwiftUI
import Alamofire

extension DiscoverContentView {
    class DiscoverViewModel: ObservableObject {
        @Published var data: [Person] = []
    }
}

struct DiscoverContentView: View {
    @State var searchTerm: String = ""
    @State var showFilterPeopleContentView = false
    @StateObject var locationManager = LocationManager()
    @ObservedObject var viewModel = DiscoverViewModel()
    
    var body: some View {
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
                        FilterPeopleContentView(locationManager: locationManager)
                    }
                    Button(action: {
                        
                    }, label: {
                        Image(systemName: "magnifyingglass").font(.system(size: 25, weight: .regular)).foregroundColor(.white)
                    }).padding(.trailing, 20)
                }
                
                List {
                    ForEach(0..<5) { card in
                        DiscoverPeopleCardContentView(bgImage: .constant(Constants.discoverPeopleCard1), username: .constant("painforever"))
                        
                    }
                }.frame(maxWidth: .infinity)
            }
        }.onChange(of: self.locationManager.lastLocation) { newValue in
            if let user_id = UserDefaults.standard.string(forKey: Constants.userId), let lat = self.locationManager.lastLocation?.coordinate.latitude, let lon = self.locationManager.lastLocation?.coordinate.longitude {
                AF.request("\(Constants.BaseUrl)/discovers/index", method: .get, parameters: ["user_id": user_id, "lat": lat, "lon": lon]).responseData { data in
                    
                }
            }
        }
    }
}

struct DiscoverContentView_Previews: PreviewProvider {
    static var previews: some View {
        DiscoverContentView()
    }
}
