//
//  ThemeTextField.swift
//  Knock_iOS
//
//  Created by yusong on 11/7/21.
//

import SwiftUI

struct ThemeTextField: ViewModifier {
    func body(content: Content) -> some View {
        content.padding().overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.white, lineWidth: 1)).foregroundColor(.white).padding()
    }
}
