//
//  Constants.swift
//  Knock_iOS
//
//  Created by yusong on 10/27/21.
//

import Foundation
import SwiftUI

class Constants {
    static let BaseUrl = "http://127.0.0.1:3000/api"
    //static let themeColor = Color(red: 0 / 255, green: 207 / 255, blue: 105 / 255)
    static let themeColor = #colorLiteral(red: 0.012700947, green: 0.6936134696, blue: 0.8442209959, alpha: 1)
    
    // LocalStorages
    static let userId = "user_id"
    static let firstTimeUseApp = "first_time_use_app"
    static func resetUserDefaults() {
        UserDefaults.standard.removeObject(forKey: Constants.firstTimeUseApp)
        UserDefaults.standard.removeObject(forKey: Constants.userId)
    }
}
