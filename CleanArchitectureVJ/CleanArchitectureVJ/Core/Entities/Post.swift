//
//  User.swift
//  CleanArchitectureVJ
//
//  Created by Vijay on 26/06/25.
//

import Foundation

public struct Post
{
    public let id: Int?
    public let userId: Int?
    public let title: String?
    public let body: String?
    
    public init(id: Int?, userId: Int?, title: String?, body: String?) {
        self.id = id
        self.userId = userId
        self.title = title
        self.body = body
    }
}
