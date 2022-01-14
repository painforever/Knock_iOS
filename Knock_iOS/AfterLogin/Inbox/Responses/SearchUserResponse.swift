//
//  SearchUserResponse.swift
//  Knock_iOS
//
//  Created by yusong on 1/13/22.
//

import Foundation

struct SearchUserResponse: Codable, Identifiable {
    var id: Int
    var username: String
    var s3AvatarPhoto: S3AvatarPhoto
    
    struct S3AvatarPhoto: Codable {
        var url: String
    }
}
