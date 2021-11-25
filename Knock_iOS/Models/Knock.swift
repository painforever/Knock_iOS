//
//  Knock.swift
//  Knock_iOS
//
//  Created by yusong on 11/19/21.
//


import SwiftUI

struct Knock: Identifiable {
    var id = UUID().uuidString
    var knockId: Int
    var userId: Int
    var knockType: String
    var subject: String
    var knockeeId: Int
    var username: String
    var sentAt: String
}
