//
//  OnBoardingContentView2.swift
//  Knock_iOS
//
//  Created by yusong on 10/27/21.
//

import SwiftUI

struct OnBoardingContentView2: View {
    var body: some View {
        ZStack {
            Rectangle().fill(Color(Constants.themeColor))
            Image("onboarding1").resizable().frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 2, alignment: .center).scaledToFit().overlay(Rectangle().fill(Color.black).opacity(0.7))
            VStack {
                Spacer()
                Text("Expand your network.").foregroundColor(Color.white).foregroundColor(Color.white).fontWeight(.bold).font(.system(size: 25)).padding()
                Text("I have hinted that I would often jerk poor Queenqueg from between  the whale and the ship--where he would occasionally fall, from the incessant rolling.").foregroundColor(Color.white).padding()
                //Text("Consider: Safe growth with an index annuity").foregroundColor(Color.white).multilineTextAlignment(.center).padding()
                Spacer()
                OnBoardingFooterContentView().padding()
                
            }.padding()
        }.ignoresSafeArea()
    }
}

struct OnBoardingContentView2_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardingContentView2()
    }
}
