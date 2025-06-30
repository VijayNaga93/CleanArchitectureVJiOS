//
//  LoginUseCase.swift
//  CleanArchitectureVJ
//
//  Created by Vijay on 26/06/25.
//

import Foundation

public struct LoginUseCase {
    private let repository: AuthRepository
    private let analytics: AnalyticsTracker
    
   public init(repository: AuthRepository, analytics: AnalyticsTracker) {
        self.repository = repository
        self.analytics = analytics
    }
    
   public func execute(username: String, password: String) async throws -> User {
        // Business rule 1: Input validation
        guard !username.isEmpty, !password.isEmpty else {
            throw LoginError.inputMissing
        }
        
        // Business rule 2: Check password strength
        guard password.count >= 6 else {
            throw LoginError.weakPassword
        }
        
        // Delegate actual login process to repository
        let user = try await repository.login(username: username, password: password)
        
        if let token = user.token {
            let tokenStore: TokenStore = KeychainTokenStore()
            try tokenStore.saveToken(token)
        }
        analytics.log(event: "user_logged_in", parameters: ["userId": user.id ?? 0])
        return user
    }
}

public enum LoginError: LocalizedError {
    case inputMissing
    case weakPassword
    case invalidCredentials
    
    public var errorDescription: String? {
        switch self {
        case .inputMissing:
            return "Username and password must not be empty."
        case .weakPassword:
            return "Password must be at least 6 characters."
        case .invalidCredentials:
            return "Invalid Credentials"
        }
    }
}
