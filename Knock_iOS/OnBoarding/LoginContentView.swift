//
//  LoginContentView.swift
//  Knock_iOS
//
//  Created by yusong on 10/27/21.
//

import SwiftUI

extension LoginContentView {
    class LoginContentViewViewModel: ObservableObject {
        @Published var email: String = ""
        @Published var emailError: String = ""
        @Published var password: String = ""
        @Published var passwordError: String = ""
        
        init() {
//            $email.map { $0.count > 0 && ($0.count < 4 || !Validators.isValidEmail($0)) ? "Email is not valid!" : "" }.assign(to: &$emailError)
//            $password.map { $0.count < 6 && $0.count > 0 ? "Password is not valid!" : ""}.assign(to: &$passwordError)
        }
    }
}

struct LoginContentView: View {
    @EnvironmentObject var onBoardingObserver: OnBoardingObserver
    
    @State var loginSuccess: Bool = false
    @State var credentialsWrong: Bool = false
    @State var isLoading: Bool = false
    
    @ObservedObject var viewModel = Self.LoginContentViewViewModel()
    
    var body: some View {
        if loginSuccess {
            TabbarContentView()
        } else {
            ZStack {
                Rectangle().fill(Color(Constants.themeColor))
                VStack {
                    VStack(alignment: .leading, spacing: 20) {
                        Text("Log in").foregroundColor(.white).fontWeight(.bold).font(.system(size: 30))
                        TextField("Email address", text: self.$viewModel.email).padding().overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.white, lineWidth: 1)).foregroundColor(.white)
                        
                        if viewModel.emailError.count > 0 {
                            Text(viewModel.emailError).padding(.horizontal, 30).foregroundColor(.red)
                        }
                        
                        
                        SecureField("Password", text: self.$viewModel.password).padding().overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.white, lineWidth: 1)).foregroundColor(.white)
                        
                        if viewModel.passwordError.count > 0 {
                            Text(viewModel.passwordError).padding(.horizontal, 30).foregroundColor(.red)
                        }
                    }.padding()
                    
                    VStack(alignment: .center, spacing: 20) {
                        NavigationLink(
                            destination: TabbarContentView(),
                            isActive: self.$loginSuccess,
                            label: {
                                EmptyView()
                            }).hidden()
                        
                        if credentialsWrong {
                            Text("Email or password is wrong!").foregroundColor(.red).padding(.all, 0)
                        }
                        
                        Button(action: {
                            
                        }, label: {
                            Text("Login").foregroundColor(Color(Constants.themeColor)).fontWeight(.bold).font(.system(size: 20)).frame(maxWidth: .infinity).frame(height: 50).background(Color(.white)).cornerRadius(10).padding()
                        }).disabled(loginBtnDisabled())
                        .opacity(loginBtnDisabled() ? 0.7 : 1)
                    }
                    
                    HStack(spacing: 20) {
                        Text("Need an account?").foregroundColor(.white)
                        Button(action: {
                            withAnimation {
                                self.onBoardingObserver.onBoardingCurrentItem = "signup"
                            }
                        }, label: {
                            Text("Sign Up").foregroundColor(.white).underline()
                        })
                    }
                }
            }.ignoresSafeArea()
            .onTapGesture {
                dismissKeyboard()
            }
            .accentColor(.white)
        }
        
    }
    
    func loginBtnDisabled() -> Bool {
        return self.viewModel.emailError.count > 0 || self.viewModel.passwordError.count > 0 ? true : false
    }
}

struct LoginContentView_Previews: PreviewProvider {
    static var previews: some View {
        LoginContentView()
    }
}
