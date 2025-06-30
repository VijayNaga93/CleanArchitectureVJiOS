//
//  TokenStore.swift
//  CleanArchitectureVJ
//
//  Created by Vijay on 27/06/25.
//

import Foundation

protocol TokenStore {
    func saveToken(_ token: String) throws
    func getToken() throws -> String
    func clearToken()
}
