//
//  ValidationHelper.swift
//  CleanArchitectureVJ
//
//  Created by Vijay on 27/06/25.
//

import Foundation

struct ValidationHelper {
    static func isValidEmail(_ email: String) -> Bool {
        return email.contains("@") && email.contains(".")
    }
    
    static func isValidPassword(_ password: String) -> Bool {
        return password.count >= 6
    }
    
    static func isValidName(_ name: String) -> Bool {
        return !name.trimmingCharacters(in: .whitespaces).isEmpty
    }
}
