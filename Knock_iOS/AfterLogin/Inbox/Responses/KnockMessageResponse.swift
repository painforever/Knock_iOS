//
//  KnockMessageResponse.swift
//  Knock_iOS
//
//  Created by yusong on 11/19/21.
//

import Foundation

struct KnockMessageResponse: Codable, Identifiable, Hashable {
    let id: Int
    let userId: Int
    let knockId: Int
    let sentAt: String
    let senderUsername: String
    let message: String
}
