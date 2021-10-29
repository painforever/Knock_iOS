//
//  Validators.swift
//  Knock_iOS
//
//  Created by yusong on 10/28/21.
//

import Foundation
class Validators {
    static func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    
    static func isValidPassword(_ password: String) -> Bool {
        if password.count >= 6 {
            return true
        }
        else {
            return false
        }
    }
    
    static func isValidPasswordConfirm(password: String, passwordConfirm: String) -> Bool {
        if password == passwordConfirm {
            return true
        }
        else { return false }
    }
}
