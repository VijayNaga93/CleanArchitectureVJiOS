//
//  LoginUseCase.swift
//  CleanArchitectureVJ
//
//  Created by Vijay on 26/06/25.
//

import Foundation

struct SignupUseCase {
    
    private let repository: AuthRepository
    
    init(repository: AuthRepository) {
        self.repository = repository
    }
    
    func execute(name: String, email: String, password: String) async throws -> User {
        guard ValidationHelper.isValidName(name) else {
            throw SignupValidationError.invalidName
        }
        
        guard ValidationHelper.isValidEmail(email) else {
            throw SignupValidationError.invalidEmail
        }
        
        guard ValidationHelper.isValidPassword(password) else {
            throw SignupValidationError.weakPassword
        }
        
        return try await repository.signup(name: name, email: email, password: password)
    }
}

enum SignupValidationError: LocalizedError {
    case invalidName
    case invalidEmail
    case weakPassword
    
    var errorDescription: String? {
        switch self {
        case .invalidName: return "Name cannot be empty"
        case .invalidEmail: return "Please enter a valid email address"
        case .weakPassword: return "Password must be at least 6 characters"
        }
    }
}
