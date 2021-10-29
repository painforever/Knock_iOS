//
//  ViewExtensions.swift
//  Knock_iOS
//
//  Created by yusong on 10/28/21.
//

import SwiftUI
extension View {
    func dismissKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
