//
//  MockAuthRepository.swift
//  CleanArchitectureVJTests
//
//  Created by Vijay on 28/06/25.
//

import Foundation
import CleanArchitectureVJ

final class MockAuthRepository: AuthRepository {
    let result: Result<User, Error>
    
    init(result: Result<User, Error>) {
        self.result = result
    }
    
    func login(username: String, password: String) async throws -> User {
        return try result.get()
    }
    
    func signup(name: String, email: String, password: String) async throws -> User {
        fatalError("Not used in Login tests")
    }
}
