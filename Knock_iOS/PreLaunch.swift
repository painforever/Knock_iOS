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
    
    var body: some View {
        Group {
            if showApp {
                let firstTimeUseApp = UserDefaults.standard.string(forKey: Constants.firstTimeUseApp)
                if firstTimeUseApp == nil {
                    OnBoardingHubContentView()
                        .environmentObject(OnBoardingObserver())
                }
                else {
                    if let _ = UserDefaults.standard.string(forKey: Constants.userId) {
                        TabbarContentView()
                    }
                    else {
                        OnBoardingHubContentView().environmentObject(Knock_iOSApp.returnAndSetOnBoardingCurrentItemToLogin())
                    }
                }
            }
            else {
                ZStack {
                    Color(Constants.themeColor)
                    HStack {
                        Text("Honest").font(.system(size: 50)).fontWeight(.bold)
                        Text("401K").font(.system(size: 48)).foregroundColor(.white)
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
