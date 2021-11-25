//
//  Calenda+KnockReponse.swift
//  Knock_iOS
//
//  Created by yusong on 11/24/21.
//

import SwiftUI

struct KnockCalendarResponse: Codable, Identifiable, Hashable {
    var id = UUID().uuidString
    var knockId: Int
    var subject: String
    var knockDatetime: String
}
