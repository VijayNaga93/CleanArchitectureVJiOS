//
//  PostDetailUseCase.swift
//  CleanArchitectureVJ
//
//  Created by Vijay on 27/06/25.
//

import Foundation

struct PostDetailUseCase {
    private let repository: DataRepository
    
    init(repository: DataRepository) {
        self.repository = repository
    }
    
    func execute(postId: Int) async throws -> Post {
        try await repository.fetchPostDetail(postId: postId)
    }
}
