//
//  SignupContentView.swift
//  Knock_iOS
//
//  Created by yusong on 10/27/21.
//

import SwiftUI

struct SignupContentView: View {
    @EnvironmentObject var onBoardingObserver : OnBoardingObserver
    @State var email: String = ""
    @State var password: String = ""
    @State var passwordConfirm: String = ""
    
    @State var passwordConfirmValid: Bool = true
    @State var passwordValid: Bool = true
    @State var emailValid: Bool = true
    @State var emailDuplicated: Bool = false
    
    @State var signupSuccess: Bool = false
    
    var body: some View {
        if signupSuccess {
            TabbarContentView()
        }
        else {
            ZStack {
                Rectangle().fill(Color(Constants.themeColor))
                VStack {
                    VStack(alignment: .leading, spacing: 20) {
                        Text("Create an Account").fontWeight(.bold).font(.system(size: 30)).foregroundColor(.white)
                        TextField("Email address", text: self.$email).onChange(of: email, perform: { value in
                            
                            self.emailValid = Validators.isValidEmail(value)
                            
                        }).foregroundColor(.white).padding().overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.white, lineWidth: 1))
                        
                        if !emailValid { Text("Email is invalid!").foregroundColor(.red).padding(.leading, 0) }
                        if emailDuplicated {
                            Text("Email is already taken!").foregroundColor(.red).padding(.leading, 0) }
                        
                        SecureField("Password", text: self.$password).foregroundColor(.white).padding().overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.white, lineWidth: 1)).onChange(of: password, perform: { value in
                            
                            self.passwordValid = Validators.isValidPassword(value)
                            
                        })
                        
                        if !passwordValid { Text("Password should be 6 characters or more").foregroundColor(.red).padding(.leading, 0) }
                        
                        SecureField("Password Confirm", text: self.$passwordConfirm).foregroundColor(.white).padding().overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.white, lineWidth: 1)).onChange(of: passwordConfirm, perform: { value in
                            
                            self.passwordConfirmValid = Validators.isValidPasswordConfirm(password: self.password, passwordConfirm: self.passwordConfirm)
                        })
                        if !passwordConfirmValid { Text("Password not match!").foregroundColor(.red).padding(.leading, 0) }
                        
                        //Text("6 characters or more").foregroundColor(.white)
                    }.padding()
                    
                    VStack(alignment: .center, spacing: 20) {
                        Button(action: {
                            if !toggleSignupButton() {
                                return
                            }
                            
                        }, label: {
                            Text("Sign Up").foregroundColor(Color(Constants.themeColor)).fontWeight(.bold).font(.system(size: 20)).frame(maxWidth: .infinity).frame(height: 50).background(Color(.white)).cornerRadius(10).padding(.horizontal, 15)
                        })
                        
                        HStack(spacing: 20) {
                            Text("Already have an account?").foregroundColor(.white)
                            Button(action: {
                                withAnimation {
                                    self.onBoardingObserver.onBoardingCurrentItem = "login"
                                }
                            }, label: {
                                Text("Login").foregroundColor(.white).underline()
                            })
                        }
                    }
                }
            }
            .onTapGesture {
                dismissKeyboard()
            }
            .ignoresSafeArea()
        }
    }
    
    func toggleSignupButton() -> Bool {
        if Validators.isValidEmail(self.email) && Validators.isValidPassword(self.password) && Validators.isValidPasswordConfirm(password: self.password, passwordConfirm: self.passwordConfirm) {
            return true
        }
        else {
            if email.count == 0 { self.emailValid = false }
            if password.count == 0 { self.passwordValid = false }
            return false
        }
    }
}

struct SignupContentView_Previews: PreviewProvider {
    static var previews: some View {
        SignupContentView()
    }
}
