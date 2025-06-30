//
//  User.swift
//  CleanArchitectureVJ
//
//  Created by Vijay on 26/06/25.
//

import Foundation

public struct User {
    public let id: Int?
    public let username: String?
    public let email: String?
    public let token: String?
    
   public init(id: Int?, username: String?, email: String?, token: String?) {
        self.id = id
        self.username = username
        self.email = email
        self.token = token
    }
}
