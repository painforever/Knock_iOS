//
//  OnBoardingContentView1.swift
//  Knock_iOS
//
//  Created by yusong on 10/27/21.
//

import SwiftUI

struct OnBoardingContentView1: View {
    var body: some View {
        ZStack {
            Rectangle().fill(Color(Constants.themeColor))
            Image("onboarding1").resizable().frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 2, alignment: .center).scaledToFit().overlay(Rectangle().fill(Color.black).opacity(0.7))
            VStack {
                Spacer()
                Text("Earn money from your expertise.").foregroundColor(Color.white).foregroundColor(Color.white).fontWeight(.bold).font(.system(size: 25)).padding()
                Text("Just so, from the ship's steep side, did I hold Queenqueg down there in the sea, by what is technically called in the fishery a monkey-rope.").foregroundColor(Color.white).padding()
                Spacer()
                OnBoardingFooterContentView().padding()
                
            }.padding()
        }.ignoresSafeArea()
    }
}

struct OnBoardingContentView1_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardingContentView1()
    }
}
