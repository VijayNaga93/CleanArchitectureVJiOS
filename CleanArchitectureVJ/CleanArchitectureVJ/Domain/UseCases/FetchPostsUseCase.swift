//
//  LoginUseCase.swift
//  CleanArchitectureVJ
//
//  Created by Vijay on 26/06/25.
//

import Foundation

struct FetchPostsUseCase {
  
    private let repository: DataRepository
    
    init(repository: DataRepository) {
        self.repository = repository
    }
    
    /*
     Keep it clean and focused only on orchestration — no decoding, no API calls
     
     Don’t add any extra logic or tasks—just handle the coordination of different parts or steps.
    
     The job of this code or component is only to manage the flow (who does what and when), not to do the actual work itself.
     */

    
    // api call only setup
    func execute() async throws -> [Post] {
        try await repository.fetchPosts()
    }
    
    // CoreData Flow:
    // API call response data to Local DB coredata setup
    func executeLocal() async throws -> [Post] {
        do {
            let posts = try await repository.fetchPostsFromAPI()
            try repository.savePostsLocally(posts)
            return posts
        } catch {
            return try repository.fetchPostsFromCache()
        }
    }
}
