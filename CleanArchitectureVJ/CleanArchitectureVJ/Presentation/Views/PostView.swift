//
//  PostView.swift
//  CleanArchitectureVJ
//
//  Created by Vijay on 26/06/25.
//

import SwiftUI

struct PostView: View {
    @StateObject var viewModel: PostsViewModel
    
    var body: some View {
        NavigationStack {
            if viewModel.isLoading {
                ProgressView("Loading...")
            } else if let error = viewModel.errorMessage {
                Text(error)
                    .foregroundColor(.red)
            } else {
                List(viewModel.posts, id: \.id) { post in
                    VStack(alignment: .leading) {
                        Text(post.title ?? "")
                            .font(.headline)
                        Text(post.body ?? "")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                        
                        NavigationLink(destination: {
                            let api = DataAPIService()
                            let repo = DataRepositoryImpl(api: api)
                            let detailUseCase = PostDetailUseCase(repository: repo)
                            let detailVM = PostDetailViewModel(postId: post.id ?? 0, useCase: detailUseCase)
                            PostDetailView(viewModel: detailVM)
                        }) {
                            Text("View Post #\(post.id)")
                                .font(.subheadline)
                                .foregroundColor(.blue)
                        }
                        
                    }
                }
            }
        }
        .navigationTitle("Posts")
        .task {
            await viewModel.loadPosts()
        }
        
    }
}



#Preview {
    let dummyUseCase = FetchPostsUseCase(repository: DummyDataRepository())
    let vm = PostsViewModel(fetchPostsUseCase: dummyUseCase)
    PostView(viewModel: vm)
}

/*
 
 struct PostView_PreviewWrapper: View {
 @StateObject var vm = PostsViewModel(fetchPostsUseCase: FetchPostsUseCase(repository: DummyDataRepository()))
 
 var body: some View {
 PostView(viewModel: vm)
 .task {
 await vm.loadPosts()
 }
 }
 }
 
 #Preview {
 PostView_PreviewWrapper()
 }
 */
