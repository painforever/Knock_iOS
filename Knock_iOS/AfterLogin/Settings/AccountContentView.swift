//
//  AccountContentView.swift
//  Knock_iOS
//
//  Created by yusong on 11/7/21.
//

import SwiftUI
import Alamofire
import SDWebImageSwiftUI

struct AccountContentView: View {
    @EnvironmentObject var loginContentViewViewModel: LoginContentView.LoginContentViewViewModel
    
    @State var email: String = ""
    @State var username: String = ""
    @State var password: String = ""
    @State var passwordConfirm: String = ""
    @State var preferredDistance = 10.0
    @State var anyDistance: Bool = true
    
    @State var cardNumber: String = ""
    @State var cardExpireDate: String = ""
    @State var CVC: String = ""
    
    @State private var avatarUrl: String = "https://st3.depositphotos.com/1007566/13175/v/600/depositphotos_131750410-stock-illustration-woman-female-avatar-character.jpg"
    @State private var showingImagePicker = false
    @State private var avatarImage: UIImage?
    @State private var avatarImageName: String = ""
    
    var body: some View {
        ZStack {
            Rectangle().fill(Color(Constants.themeColor)).ignoresSafeArea()
            ScrollView {
                VStack {
                    AnimatedImage(url: URL(string: avatarUrl)).resizable().aspectRatio(contentMode: .fit).frame(width: 150, height: 150)
                        .cornerRadius(75)
                        .padding(.horizontal, 5)
                    Text("#\(username)").font(.system(size: 20)).font(.body).foregroundColor(.white)
                    TextField("Email", text: self.$email).frame(height: 20).modifier(ThemeTextField())
                    
                    SecureField("Password", text: self.$password).frame(height: 20).modifier(ThemeTextField())
                    
                    SecureField("Password Confirm", text: self.$passwordConfirm).frame(height: 20).modifier(ThemeTextField())
                    
                    VStack {
                        VStack {
                            Text("  Distance(miles): \(showMiles())").foregroundColor(.white)
                            Toggle("Any Distance", isOn: $anyDistance).foregroundColor(.white)
                        }
                        if anyDistance == false {
                            Slider(value: $preferredDistance, in: 0...100, onEditingChanged: { _ in }).accentColor(.white)
                        }
                    }.padding()
                
                    HStack(spacing: 20) {
                        showFileSelected()
                        Button {
                            showingImagePicker = true
                        } label: {
                            Text("Open Gallary")
                                .padding()
                                .foregroundColor(Color(Constants.themeColor))
                                .background(Color.white)
                                .cornerRadius(10)
                        }
                    }.padding(.horizontal, 30)
                    .padding(.vertical, 10)
                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.white, lineWidth: 1)).frame(maxWidth: .infinity)
                    
                    VStack {
                        VStack(alignment: .center) {
                            Text("Card Information").foregroundColor(.white).padding(.top, 30)
                            HStack {
                                Image("visa").resizable().frame(width: 50, height: 50)
                                Image("master_card").resizable().frame(width: 50, height: 30)
                                Image("discover_card").resizable().frame(width: 50, height: 30)
                            }
                        }
                        TextField("Card Number", text: self.$cardNumber).frame(height: 20).modifier(ThemeTextField())
                        HStack {
                            TextField("MM/YY", text: self.$cardExpireDate).frame(height: 20).modifier(ThemeTextField())
                            TextField("CVC", text: self.$CVC).frame(height: 20).modifier(ThemeTextField())
                        }
                    }.padding()
                    
                    Button(action: {
                        if let userId = UserDefaults.standard.string(forKey: Constants.userId) {
                            
                            var parameters: [String: String] =  ["email": self.email, "password": self.password]
                         
                            if let avatarImage = avatarImage {
                                let avatarImageData: Data = avatarImage.jpegData(compressionQuality: 0.1) ?? Data()
                                upload(image: avatarImageData, params: parameters, userId: userId)
                            }
                        }
                    }, label: {
                        Text("Update").themeButton(height: 50)
                    })
                    
                    Button {
                        UserDefaults.standard.removeObject(forKey: Constants.userId)
                        loginContentViewViewModel.loginSuccess = false
                    } label: {
                        Text("Logout").themeButton(height: 50)
                    }

                }.onAppear {
                    if let userId = UserDefaults.standard.string(forKey: Constants.userId) {
                        AF.request("\(Constants.BaseUrl)/users/\(userId)", method: .get).responseJSON { data in
                            let jsonDecoder = JSONDecoder()
                            jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
                            let json = try! jsonDecoder.decode(User.self, from: data.data!)
                            avatarUrl = json.s3AvatarPhoto.url
                            email    = json.email
                            username = json.username
                        }
                    }
                }
                .sheet(isPresented: $showingImagePicker, onDismiss: loadImage) {
                    ImagePicker(image: self.$avatarImage, imageName: self.$avatarImageName)
                }
            }
        }
    }
    
    func showMiles() -> String {
        if anyDistance {
            return ""
        }
        else {
            return String(Int(preferredDistance))
        }
    }
    
    @ViewBuilder
    func showFileSelected() -> some View {
        if let _ = avatarImage {
            Group {
                Text("Avatar Selected").foregroundColor(.white)
                Image(systemName: "checkmark").foregroundColor(.white)
            }
        }
        else {
            Group {
                Text("Upload Avatar").foregroundColor(.white)
            }
        }
    }
    
    func loadImage() {
        guard let selectedImage = avatarImage else { return }
        let image = Image(uiImage: selectedImage)
    }
    
    func upload(image : Data, params: [String: String], userId: String) {
        let urlString = "\(Constants.BaseUrl)/users/\(userId)"
        let headers: HTTPHeaders =
            ["Content-type": "multipart/form-data",
            "Accept": "application/json"]
        AF.upload(multipartFormData: { multipartFormData in
            multipartFormData.append(email.description.data(using: .utf8)!, withName: "email")
            multipartFormData.append(password.description.data(using: .utf8)!, withName: "password")
            multipartFormData.append(image, withName: "s3_avatar_photo", fileName: "\(avatarImageName)", mimeType: "image/png")
        }, to: urlString, method: .patch, headers: headers).responseJSON { (resp) in
            print("DEBUG: resp is \(resp)")
            let jsonDecoder = JSONDecoder()
            jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
            let json = try! jsonDecoder.decode(User.self, from: resp.data!)
            avatarUrl = json.s3AvatarPhoto.url
        }
    }
}

struct AccountContentView_Previews: PreviewProvider {
    static var previews: some View {
        AccountContentView()
    }
}

