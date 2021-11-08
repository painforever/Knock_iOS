//
//  DateValue.swift
//  Knock_iOS
//
//  Created by yusong on 11/8/21.
//

import SwiftUI

//Date Value Model
struct DateValue: Identifiable {
    var id = UUID().uuidString
    var day: Int
    var date: Date
}
