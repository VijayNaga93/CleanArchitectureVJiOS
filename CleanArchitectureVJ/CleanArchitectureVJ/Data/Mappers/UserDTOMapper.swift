//
//  UserDTOMapper.swift
//  CleanArchitectureVJ
//
//  Created by Vijay on 26/06/25.
//

import Foundation

struct UserDTO {
    let id: Int
    let username: String
    let token: String
    let email: String
}

extension UserDTO { // Data Transfer Object
    func toDomain() -> User {
        return User(id: id, username: username, email: email, token: token)
    }
}


/*
 ✅ User.swift (in Core/Entities)
 •    Layer: Core (Entities)
 •    Purpose: Represents the domain model — your app’s pure, business-layer object.
 •    Independent of any external service or framework.
 •    Used by: Use Cases, ViewModels
 
 ✅ UserDTOMapper.swift (with UserDTO)
 •    Layer: Data (Mappers)
 •    Purpose: Translates raw API response into your domain model (User)
 •    DTO stands for Data Transfer Object — it matches the JSON structure
 •    Used by: Repository layer to map API data to domain models
 
 This helps you isolate your app from API changes — if the backend changes the response format, only the DTO/mapper needs updates.
 
 
 */
