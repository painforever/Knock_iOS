//
//  OnBoardingHubContentView.swift
//  Knock_iOS
//
//  Created by yusong on 10/27/21.
//

import SwiftUI

struct OnBoardingHubContentView: View {
    @EnvironmentObject var onBoardingObserver: OnBoardingObserver
    
    var body: some View {
        if onBoardingObserver.onBoardingCurrentItem == "onboarding" {
            OnBoardingContentView()
        }
        else if onBoardingObserver.onBoardingCurrentItem == "login" {
            LoginContentView().transition(.opacity)
        }
        else if onBoardingObserver.onBoardingCurrentItem == "signup" {
            SignupContentView().transition(.opacity)
        }
    }
}

struct OnBoardingHubContentView_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardingHubContentView().environmentObject(OnBoardingObserver())
    }
}
