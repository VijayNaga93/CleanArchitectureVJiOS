//
//  AuthRepository.swift
//  CleanArchitectureVJ
//
//  Created by Vijay on 26/06/25.
//

import Foundation

protocol DataRepository {
    func fetchPosts() async throws -> [Post]
    func fetchPostDetail(postId: Int) async throws -> Post
}

// CoreData Flow:
//protocol PostRepository {
//    func fetchPostsFromAPI() async throws -> [Post]
//    func fetchPostsFromCache() throws -> [Post]
//    func savePostsLocally(_ posts: [Post]) throws
//}
