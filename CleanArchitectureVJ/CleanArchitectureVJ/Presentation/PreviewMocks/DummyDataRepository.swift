//
//  DummyDataRepository.swift
//  CleanArchitectureVJ
//
//  Created by Vijay on 27/06/25.
//

#if DEBUG
import Foundation

class DummyDataRepository: DataRepository {
    func fetchPostDetail(postId: Int) async throws -> Post {
        return Post(id: 1, userId: 1, title: "Sample Post", body: "This is a preview post body.")
    }
    
    func fetchPosts() async throws -> [Post] {
        return [
            Post(id: 1, userId: 11, title: "Sample Post1", body: "This is a preview post body.1"),
            Post(id: 2, userId: 22, title: "Sample Post2", body: "This is a preview post body.2"),
            Post(id: 3, userId: 33, title: "Sample Post3", body: "This is a preview post body.3")
        ]
    }
}
#endif
