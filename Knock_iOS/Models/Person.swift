//
//  Person.swift
//  Knock_iOS
//
//  Created by yusong on 11/12/21.
//

import Foundation

struct Person: Identifiable {
    let id = UUID().uuidString
    let username: String
    let city: String
    let price: String
    let occupation: String
    let locationAcceptedDistance: String
    let dnas: String
    var s3AvatarPhoto: String
}
