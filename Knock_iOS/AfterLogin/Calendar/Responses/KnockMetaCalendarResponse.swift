//
//  KnockMetaCalendarResponse.swift
//  Knock_iOS
//
//  Created by yusong on 12/2/21.
//

import SwiftUI

struct KnockMetaCalendarResponse: Codable {
    //var id = UUID().uuidString
    var knocks: [KnockCalendarResponse]
    var knockDate: Date
}
