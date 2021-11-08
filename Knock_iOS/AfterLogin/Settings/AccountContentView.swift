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
    
    var body: some View {
        ZStack {
            Rectangle().fill(Color(Constants.themeColor))
            VStack {
                TextField("Email", text: self.$email).frame(height: 20).modifier(ThemeTextField())
                TextField("Password", text: self.$password).frame(height: 20).modifier(ThemeTextField())
                TextField("Password Confirm", text: self.$passwordConfirm).frame(height: 20).modifier(ThemeTextField())
                VStack {
                    VStack {
                        Text("Distance(miles): \(showMiles())").foregroundColor(.white)
                        Toggle("Any Distance", isOn: $anyDistance).foregroundColor(.white)
                    }
                    if anyDistance == false {
                        Slider(value: $preferredDistance, in: 0...100, onEditingChanged: { _ in }).accentColor(.white)
                    }
                }.padding()
                Button(action: {
                    
                }, label: {
                    Text("Update").themeButton(height: 50)
                })
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
}

struct AccountContentView_Previews: PreviewProvider {
    static var previews: some View {
        AccountContentView()
    }
}
