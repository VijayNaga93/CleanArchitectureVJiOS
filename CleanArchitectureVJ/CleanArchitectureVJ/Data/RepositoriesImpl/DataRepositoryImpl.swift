//
//  DataRepositoryImpl.swift
//  CleanArchitectureVJ
//
//  Created by Vijay on 26/06/25.
//

import Foundation

final class DataRepositoryImpl: DataRepository
{
    private let api: DataAPIService
    
    init(api: DataAPIService)
    {
        self.api = api
    }
    
    //     This should consume the api result and convert DTOs to domain models (Post).
    func fetchPosts() async throws -> [Post] {
        let result = await api.fetchPosts()
        switch result {
        case .success(let dtos):
            return dtos.map { $0.toDomain() }
        case .failure(let failure):
            throw failure
        }
    }
    
    func fetchPostDetail(postId: Int) async throws -> Post {
        let result = await api.fetchPostDetail(postId: postId)
        switch result {
        case .success(let dto):
            return dto.toDomain()
        case .failure(let error):
            throw error
        }
    }
    
}


// CoreData Flow:
//final class PostRepositoryImpl: PostRepository {
//    let api: PostAPIService
//    let local: CoreDataPostStore
//
//    func fetchPostsFromAPI() async throws -> [Post] {
//        let dtos = try await api.fetchPosts()
//        return dtos.map { $0.toDomain() }
//    }
//
//    func savePostsLocally(_ posts: [Post]) throws {
//        try local.save(posts)
//    }
//
//    func fetchPostsFromCache() throws -> [Post] {
//        return try local.fetch().map { $0.toDomain() }
//    }
//}
