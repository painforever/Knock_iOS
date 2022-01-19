//
//  ProfileContentView.swift
//  Knock_iOS
//
//  Created by yusong on 1/17/22.
//

import SwiftUI
import SDWebImageSwiftUI
import Alamofire

struct ProfileContentView: View {
    @Environment(\.presentationMode) var presentationMode
    
    @State var avatarUrl: String = ""
    @Binding var username: String
    @State var state: String = "VA"
    @State var city: String = "Arlington"
    
    var body: some View {
        ScrollView {
            GeometryReader { g in
                VStack {
                    VStack {
                        HStack {
                            Spacer()
                            Button {
                                presentationMode.wrappedValue.dismiss()
                            } label: {
                                Text("Dismiss").bold().padding(.top, 10)
                            }

                        }.padding()
                        VStack {
                            AnimatedImage(url: URL(string: avatarUrl)).resizable().frame(width: 150, height: 150).cornerRadius(75)
                            Text("#\(username)").bold()
                            HStack {
                                Image(systemName: "location.circle.fill")
                                Text("1600 S Joyce St, \(city), \(state)")
                            }
                        }
                        HStack {
                            Text("Total Meetings: \(45)")
                            Spacer()
                            HStack(spacing: 2) {
                                Text("Rating: ")
                                ForEach(1..<5, id: \.self) { number in
                                    Image(systemName: "star.fill").resizable().frame(width: 20, height: 20).foregroundColor(.yellow)
                                }
                            }
                        }.padding()
                        HStack {
                            Text("Satisfaction: \(87)%")
                            Spacer()
                            Text("Total hours: \(341) hrs")
                        }.padding()
                    }
                    .frame(width: g.size.width, height: g.size.height * 0.50)
                    .background(Color(Constants.themeColor))
                    .foregroundColor(.white)
                    
                    VStack(spacing: 30) {
                        HStack(spacing: 30) {
                            OperationCellContentView(icon: .constant("knock"), title: .constant("Send Knock"), sideLength: .constant(130))
                            OperationCellContentView(icon: .constant("message"), title: .constant("Send Message"), sideLength: .constant(130))
                        }
                        DNAsContentView()
                        Spacer()
                    }
                    .frame(width: g.size.width, height: g.size.height * 0.50)
                    .padding(.top, 30)
                }
            }.frame(height: UIScreen.main.bounds.height)
        }
        .ignoresSafeArea()
        .onAppear {
            loadData()
        }
    }
    
    func loadData() {
        AF.request("\(Constants.BaseUrl)/users/get_user_by_username?username=\(username)", method: .get).responseJSON { data in
            let jsonDecoder = JSONDecoder()
            jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
            let json = try! jsonDecoder.decode(User.self, from: data.data!)
            avatarUrl = json.s3AvatarPhoto.url
            username = json.username
            city = json.city
            state = json.state
        }
    }
}

struct ProfileContentView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileContentView(username: .constant("painforever"))
    }
}
