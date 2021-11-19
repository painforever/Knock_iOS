//
//  Knock.swift
//  Knock_iOS
//
//  Created by yusong on 11/19/21.
//

import Foundation

struct KnockResponse: Codable, Identifiable, Hashable {
    let id: Int
    let userId: Int
    let knockType: String
    let subject: String
    let knockeeId: Int
    let username: String
    let sentAt: String
    
    enum CodingKeys: String, CodingKey {
        case userId = "user_id"
        case knockType = "knock_type"
        case knockeeId = "knockee_id"
        case sentAt = "sent_at"
        case id, subject, username
    }
}
