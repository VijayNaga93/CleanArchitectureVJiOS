//
//  AuthRepositoryImpl.swift
//  CleanArchitectureVJ
//
//  Created by Vijay on 26/06/25.
//

import Foundation

final class AuthRepositoryImpl: AuthRepository {
    
    private let apiService: AuthAPIService

    init(apiService: AuthAPIService) {
        self.apiService = apiService
    }

    func login(username: String, password: String) async throws -> User {
        let dto = try await apiService.login(username: username, password: password)
        return dto.toDomain()
    }
    
    func signup(name: String, email: String, password: String) async throws -> User {
        let dto = try await apiService.signup(name: email, email: email, password: password)
        return dto.toDomain()
    }
}
