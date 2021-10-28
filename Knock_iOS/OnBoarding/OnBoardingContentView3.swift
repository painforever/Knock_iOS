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
                Text("Check My 401(k) Risk Level").foregroundColor(Color.white).foregroundColor(Color.white).fontWeight(.bold).font(.system(size: 25)).padding()
                Text("Know how risky your portfolio is").foregroundColor(Color.white).padding()
                Text("Consider: Safe growth with an index annuity").foregroundColor(Color.white).multilineTextAlignment(.center).padding()
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
