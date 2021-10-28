//
//  OnBoardingContentView.swift
//  Knock_iOS
//
//  Created by yusong on 10/27/21.
//

import SwiftUI

struct OnBoardingContentView: View {
    @State var backgroundOffset: CGFloat = 0
    let indicatorActiveSize: CGFloat = 10
    let indicatorDeactiveSize: CGFloat = 5
    let indicatorLineWidth: CGFloat = 1
        
    var body: some View {
        //NavigationView {
            GeometryReader { g in
                HStack(spacing: 0) {
                    OnBoardingContentView1().frame(width: g.size.width, height: g.size.height)
                    OnBoardingContentView2().frame(width: g.size.width, height: g.size.height)
                    OnBoardingContentView3().frame(width: g.size.width, height: g.size.height)
                }.offset(x: -(self.backgroundOffset) * g.size.width)
                .animation(.default)
                
                ZStack {
                    Rectangle().fill(Color.white.opacity(0.3)).frame(width: 100, height: 20).cornerRadius(10)
                    VStack {
                        HStack {
                            self.indicatorDifferentSizes()
                        }.animation(.default)
                    }
                }.position(x: g.size.width / 2, y: g.size.height / 1.2)
            }
            .ignoresSafeArea()
            .gesture(DragGesture().onEnded({ value in
                if value.translation.width > 10 {
                    if self.backgroundOffset > 0 {
                        self.backgroundOffset -= 1
                    }
                    
                }
                else if value.translation.width < -10 {
                    if self.backgroundOffset < 2 {
                        self.backgroundOffset += 1
                    }
                }
            }))
            .onAppear {
                UserDefaults.standard.set("no", forKey: Constants.firstTimeUseApp)
            }
       // }.accentColor(.white)
    }
    
    func indicatorDifferentSizes() -> some View {
        return Group {
            Circle().fill(Color.white).frame(width: backgroundOffset == 0 ? indicatorActiveSize : indicatorDeactiveSize, height: backgroundOffset == 0 ? indicatorActiveSize : indicatorDeactiveSize).overlay(Circle().stroke(Color.white, lineWidth: indicatorLineWidth))
            Circle().fill(Color.white).frame(width: backgroundOffset == 1 ? indicatorActiveSize : indicatorDeactiveSize, height: backgroundOffset == 1 ? indicatorActiveSize : indicatorDeactiveSize).overlay(Circle().stroke(Color.white, lineWidth: indicatorLineWidth))
            Circle().fill(Color.white).frame(width: backgroundOffset == 2 ? indicatorActiveSize : indicatorDeactiveSize, height: backgroundOffset == 2 ? indicatorActiveSize : indicatorDeactiveSize).overlay(Circle().stroke(Color.white, lineWidth: indicatorLineWidth))
        }
    }
}

struct OnBoardingContentView_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardingContentView()
    }
}
