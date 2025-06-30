//
//  ValidationError.swift
//  CleanArchitectureVJ
//
//  Created by Vijay on 27/06/25.
//

import Foundation

enum ValidationError: LocalizedError {
    case emptyUsername
    case invalidEmail
    case weakPassword
    
    var errorDescription: String? {
        switch self {
        case .emptyUsername: return "Username cannot be empty"
        case .invalidEmail: return "Please enter a valid email"
        case .weakPassword: return "Password must be at least 6 characters"
        }
    }
}
