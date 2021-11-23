//
//  AccountContentView.swift
//  Knock_iOS
//
//  Created by yusong on 11/7/21.
//

import SwiftUI

struct AccountContentView: View {
    @State var email: String = ""
    @State var password: String = ""
    @State var passwordConfirm: String = ""
    @State var preferredDistance = 10.0
    @State var anyDistance: Bool = true
    
    @State private var showingImagePicker = false
    @State private var avatarImage: UIImage?
    @State private var avatarImageName: String = ""
    
    var body: some View {
        ZStack {
            Rectangle().fill(Color(Constants.themeColor))
            VStack {
                TextField("Email", text: self.$email).frame(height: 20).modifier(ThemeTextField())
                
                TextField("Password", text: self.$password).frame(height: 20).modifier(ThemeTextField())
                
                TextField("Password Confirm", text: self.$passwordConfirm).frame(height: 20).modifier(ThemeTextField())
                
                VStack {
                    VStack {
                        Text("  Distance(miles): \(showMiles())").foregroundColor(.white)
                        Toggle("Any Distance", isOn: $anyDistance).foregroundColor(.white)
                    }
                    if anyDistance == false {
                        Slider(value: $preferredDistance, in: 0...100, onEditingChanged: { _ in }).accentColor(.white)
                    }
                }.padding()
            
                HStack(spacing: 50) {
                    Text("Upload Avatar").foregroundColor(.white)
                    Image(systemName: "checkmark")
                    .foregroundColor(Color.accentColor)
                    font(.system(size: 16, weight: .regular))
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
                
                Button(action: {
                    
                }, label: {
                    Text("Update").themeButton(height: 50)
                })
            }
            .sheet(isPresented: $showingImagePicker, onDismiss: loadImage) {
                ImagePicker(image: self.$avatarImage, imageName: self.$avatarImageName)
            }
        }.ignoresSafeArea()
    }
    
    func showMiles() -> String {
        if anyDistance {
            return ""
        }
        else {
            return String(Int(preferredDistance))
        }
    }
    
    func loadImage() {
        guard let selectedImage = avatarImage else { return }
        let image = Image(uiImage: selectedImage)
    }
}

struct AccountContentView_Previews: PreviewProvider {
    static var previews: some View {
        AccountContentView()
    }
}
