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
    static let knockTypes = ["Business", "Entertainment", "Romantic", "Funny", "Secret"]
    //static let themeColor = Color(red: 0 / 255, green: 207 / 255, blue: 105 / 255)
    static let themeColor = #colorLiteral(red: 0.012700947, green: 0.6936134696, blue: 0.8442209959, alpha: 1)
    static let dnaColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
    
    // LocalStorages
    static let userId = "user_id"
    static let firstTimeUseApp = "first_time_use_app"
    static func resetUserDefaults() {
        UserDefaults.standard.removeObject(forKey: Constants.firstTimeUseApp)
        UserDefaults.standard.removeObject(forKey: Constants.userId)
    }
    
    
    //bg images for people card in Discover
    static let discoverPeopleCard1 = "https://wallpapers.com/images/high/new-york-city-2016-wallpaper-for-pc-and-mac-tablet-laptop-mobile-txvbwr1rdszlxdef.jpg"
    static let discoverPeopleCard2 = "https://lh3.googleusercontent.com/proxy/3wXEbkRqVWdqNlzke5m1yXYCde9cGAWrnkUC7gsdTjb2nMSP4YBkk3ddXgnVrq1KRNdLR94F5OjNi7ky2_3-nJQoOy0wlEenhdeGlj4YmlpYOJlHxPXv_v4r1kied7WGGCQCJsL9WXGNuoHabQdY"
    static let discoverPeopleCard3 = "https://media.istockphoto.com/photos/digital-business-interface-wallpaper-picture-id1146508655?k=20&m=1146508655&s=170667a&w=0&h=6BbLBwaPRe1DEJDYKooFLkDW0vbrjogrhhNzfc4rulU="
    static let discoverPeopleCard4 = "https://free4kwallpapers.com/uploads/originals/2020/04/05/beijing-central-business-district-wallpaper.jpg"
    static let discoverPeopleCard5 = "https://img.wallpapersafari.com/desktop/1680/1050/9/62/9BTMvX.jpg"
}
