//
//  PreLaunch.swift
//  Knock_iOS
//
//  Created by yusong on 10/27/21.
//

import SwiftUI

struct PreLaunch: View {
    @State var showApp: Bool = false
    @State var angle: Double = 360
    @State var opacity: Double = 1
    @State var scale: CGFloat = 1
    
    var onBoardingObserver: OnBoardingObserver = OnBoardingObserver()
    
    var body: some View {
        Group {
            if showApp {
                let firstTimeUseApp = UserDefaults.standard.string(forKey: Constants.firstTimeUseApp)
                if firstTimeUseApp == nil {
                    OnBoardingHubContentView().environmentObject(onBoardingObserver)
                }
                else {
                    if let _ = UserDefaults.standard.string(forKey: Constants.userId) {
                        //TabbarContentView().environmentObject(onBoardingObserver)
                        //OnBoardingHubContentView().environmentObject(onBoardingObserver)
                        
                        //Login will automatically set loginSuccess State to true to show tabs
                        LoginContentView().environmentObject(onBoardingObserver)
                    }
                    else {
                        OnBoardingHubContentView().environmentObject(Knock_iOSApp.returnAndSetOnBoardingCurrentItemToLogin())
                    }
                }
            }
            else {
                ZStack {
                    Color(Constants.themeColor)
                    VStack {
                        Text("Knock, Knock").font(.system(size: 50)).fontWeight(.bold)
                        Text("Be bold enough to know anyone who potentially useful to you.").padding().font(.system(size: 20)).foregroundColor(.white)
                    }.rotation3DEffect(.degrees(angle), axis: (x: 0.0, y: 1.0, z: 0.0))
                    .opacity(opacity)
                    .scaleEffect(scale)
                }
                .ignoresSafeArea()
                .onAppear {
                    withAnimation(Animation.linear(duration: 1.5).delay(1.5)) {
                        angle = 0
                        opacity = 0
                        scale = 3
                    }
                    withAnimation(Animation.linear(duration: 1).delay(1.5)) {
                        self.showApp = true
                    }
                }
            }
        }
        
    }
}

struct PreLaunch_Previews: PreviewProvider {
    static var previews: some View {
        PreLaunch()
    }
}
