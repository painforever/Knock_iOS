//
//  KnockMetaData.swift
//  Knock_iOS
//
//  Created by yusong on 11/24/21.
//

import SwiftUI

struct KnockMetaData: Identifiable {
    var id = UUID().uuidString
    var task: [Knock]
    var taskDate: Date
}
