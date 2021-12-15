//
//  OnBoardingContentView3.swift
//  Knock_iOS
//
//  Created by yusong on 10/27/21.
//

import SwiftUI

struct OnBoardingContentView3: View {
    var body: some View {
        ZStack {
            Rectangle().fill(Color(Constants.themeColor))
            Image("onboarding1").resizable().frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 2, alignment: .center).scaledToFit().overlay(Rectangle().fill(Color.black).opacity(0.7))
            VStack {
                Spacer()
                Text("Meet with anyone").foregroundColor(Color.white).foregroundColor(Color.white).fontWeight(.bold).font(.system(size: 25)).padding()
                Text("Being the savage's bowsman, that is,").foregroundColor(Color.white).padding()
                Text("the person pulled the heavy, soaked bow-oar in his boat").foregroundColor(Color.white).multilineTextAlignment(.center).padding()
                Spacer()
                OnBoardingFooterContentView().padding()
                
            }.padding()
        }.ignoresSafeArea()
    }
}

struct OnBoardingContentView3_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardingContentView3()
    }
}
