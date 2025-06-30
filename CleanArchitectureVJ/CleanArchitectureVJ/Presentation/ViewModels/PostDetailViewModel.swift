//
//  PostDetailViewModel.swift
//  CleanArchitectureVJ
//
//  Created by Vijay on 27/06/25.
//

import Foundation

@MainActor
class PostDetailViewModel: ObservableObject {
    @Published var post: Post?
    @Published var errorMessage: String?
    @Published var isLoading: Bool = false

    private let postId: Int
    private let useCase: PostDetailUseCase

    init(postId: Int, useCase: PostDetailUseCase) {
        self.postId = postId
        self.useCase = useCase
    }

    func loadPostDetail() async {
        isLoading = true
        do {
            post = try await useCase.execute(postId: postId)
        } catch let error as AppNetworkError {
            errorMessage = error.localizedDescription
        } catch {
            errorMessage = "Unknown error occurred"
        }
        isLoading = false
    }
}
