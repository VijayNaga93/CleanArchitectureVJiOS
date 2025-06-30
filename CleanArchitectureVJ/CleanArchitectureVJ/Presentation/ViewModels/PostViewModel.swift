//
//  PostViewModel.swift
//  CleanArchitectureVJ
//
//  Created by Vijay on 26/06/25.
//

import Foundation

@MainActor
class PostsViewModel: ObservableObject {
    @Published var posts: [Post] = []
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?
    
    private let fetchPostsUseCase: FetchPostsUseCase
    
    init(fetchPostsUseCase: FetchPostsUseCase) {
        self.fetchPostsUseCase = fetchPostsUseCase
    }
    
    func loadPosts() async {
        isLoading = true
        errorMessage = nil
        
        do {
            isLoading = false
            posts = try await fetchPostsUseCase.execute()
        } catch let error as AppNetworkError {
            errorMessage = error.localizedDescription
        } catch {
            errorMessage = "Something went wrong"
        }
    }
}
