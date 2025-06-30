//
//  PostDetailView.swift
//  CleanArchitectureVJ
//
//  Created by Vijay on 27/06/25.
//

import SwiftUI

struct PostDetailView: View {
    @StateObject var viewModel: PostDetailViewModel
    
    var body: some View {
        VStack {
            if viewModel.isLoading {
                ProgressView("Loading...")
            } else if let post = viewModel.post {
                Text(post.title ?? "")
                    .font(.title)
                    .padding()
                Text(post.body ?? "")
                    .padding()
            } else if let error = viewModel.errorMessage {
                Text(error).foregroundColor(.red)
            }
        }
        .navigationTitle("Post Detail")
        .task {
            await viewModel.loadPostDetail()
        }
    }
}

#Preview {
    let postUseCase = PostDetailUseCase(repository: DummyDataRepository())
    let postDetailViewModel = PostDetailViewModel(postId: 1, useCase: postUseCase)
    PostDetailView(viewModel: postDetailViewModel)
}

