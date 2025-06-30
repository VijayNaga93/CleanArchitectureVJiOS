//
//  AuthRepository.swift
//  CleanArchitectureVJ
//
//  Created by Vijay on 26/06/25.
//

import Foundation

public protocol AuthRepository {
    func login(username: String, password: String) async throws -> User
    func signup(name: String, email: String, password: String) async throws -> User
}
