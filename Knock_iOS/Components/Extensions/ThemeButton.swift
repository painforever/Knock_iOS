//
//  ThemeButton.swift
//  Knock_iOS
//
//  Created by yusong on 11/7/21.
//

import SwiftUI

extension Text {
    func themeButton(height: CGFloat) -> some View {
        self.foregroundColor(Color(Constants.themeColor)).fontWeight(.bold).font(.system(size: 20)).frame(maxWidth: .infinity).frame(height: height).background(Color(.white)).cornerRadius(10).padding()
    }
    
    func themeDNA() -> some View {
        self.font(.system(size: 15))
        .padding(.horizontal, 10).padding(.vertical, 5)
        .background(Color(Constants.dnaColor))
        .foregroundColor(Color(.white))
        .cornerRadius(10)
    }
}
