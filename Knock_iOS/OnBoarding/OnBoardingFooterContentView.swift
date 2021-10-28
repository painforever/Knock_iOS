//
//  OnBoardingFooterContentView.swift
//  Knock_iOS
//
//  Created by yusong on 10/27/21.
//

import SwiftUI

struct OnBoardingFooterContentView: View {
    @EnvironmentObject var onBoardingObserver: OnBoardingObserver
    
    var body: some View {
        HStack {
            Button(action: {
                withAnimation {
                    self.onBoardingObserver.onBoardingCurrentItem = "signup"
                }
            }, label: {
                Text("Sign Up").foregroundColor(.white).bold()
            })
            
            Spacer()
            
            Button(action: {
                withAnimation {
                    self.onBoardingObserver.onBoardingCurrentItem = "login"
                }
            }, label: {
                Text("Login").foregroundColor(.white).bold()
            })
        }.background(Color.clear).padding()
    }
}

struct OnBoardingFooterContentView_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardingFooterContentView()
    }
}
