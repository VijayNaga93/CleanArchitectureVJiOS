//
//  CDPostMapper.swift
//  CleanArchitectureVJ
//
//  Created by Vijay on 01/07/25.
//

import Foundation

// CoreData Flow:   
//extension CDPost {
//    func toDomain() -> Post {
//        Post(id: Int(self.id), title: self.title ?? "", body: self.body ?? "")
//    }
//
//    static func fromDomain(_ post: Post, context: NSManagedObjectContext) -> CDPost {
//        let entity = CDPost(context: context)
//        entity.id = Int64(post.id)
//        entity.title = post.title
//        entity.body = post.body
//        return entity
//    }
//}
