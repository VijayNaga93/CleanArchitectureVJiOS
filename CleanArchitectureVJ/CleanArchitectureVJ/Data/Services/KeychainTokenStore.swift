//
//  KeychainTokenStore.swift
//  CleanArchitectureVJ
//
//  Created by Vijay on 27/06/25.
//

import Foundation

// For now the token is saved in UserDefaults - in real project it should use Keychain only.

final class KeychainTokenStore: TokenStore {
    private let key = "auth_token"
    
    func saveToken(_ token: String) throws {
        // Use Keychain or UserDefaults in development
        UserDefaults.standard.set(token, forKey: key)
    }
    
    func getToken() throws -> String {
        guard let token = UserDefaults.standard.string(forKey: key) else {
            throw TokenError.notFound
        }
        return token
    }
    
    func clearToken() {
        UserDefaults.standard.removeObject(forKey: key)
    }
}

enum TokenError: Error {
    case notFound
}
