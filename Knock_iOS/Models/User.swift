//
//  User.swift
//  Knock_iOS
//
//  Created by yusong on 12/13/21.
//

import Foundation

struct User: Codable, Identifiable {
    var id: Int
    var username: String
    var email: String
    var city: String
    var state: String
    var s3AvatarPhoto: S3AvatarPhoto
    
    struct S3AvatarPhoto: Codable {
        var url: String
    }
}
