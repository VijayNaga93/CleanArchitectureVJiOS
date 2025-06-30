//
//  UserDTOMapper.swift
//  CleanArchitectureVJ
//
//  Created by Vijay on 26/06/25.
//

import Foundation

struct PostDTO: Decodable
{
    let id, userId: Int;
    let title, body: String
}

extension PostDTO
{
    func toDomain() -> Post
    {
        Post(id: id, userId: userId, title: title, body: body)
    }
}
