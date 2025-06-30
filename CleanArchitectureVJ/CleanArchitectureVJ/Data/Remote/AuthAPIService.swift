//
//  AuthAPIService.swift
//  CleanArchitectureVJ
//
//  Created by Vijay on 26/06/25.
//

import Foundation

final class AuthAPIService {
    func login(username: String, password: String) async throws -> UserDTO {
        // Simulate API call
        return UserDTO(id: 1, username: "Vijay", token: "12345", email: "test@gmail.com")
    }
    
    func signup(name: String, email: String, password: String) async throws -> UserDTO {
        // Simulate API call
        return UserDTO(id: 1, username: "Vijay", token: "12345", email: "test@gmail.com")
    }
    
}






