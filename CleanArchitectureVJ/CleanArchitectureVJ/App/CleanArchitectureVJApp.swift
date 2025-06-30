//
//  CleanArchitectureVJApp.swift
//  CleanArchitectureVJ
//
//  Created by Vijay on 25/06/25.
//

import SwiftUI

@main
struct CleanArchitectureVJApp: App {
    var body: some Scene {

        WindowGroup {
            let apiService = AuthAPIService()
            let repository = AuthRepositoryImpl(apiService: apiService)
            let analytics = ConsoleLogger()

            let loginUseCase = LoginUseCase(repository: repository, analytics: analytics)
            let loginViewModel = LoginViewModel(loginUseCase: loginUseCase)

            let signupUseCase = SignupUseCase(repository: repository)
            let signupViewModel = SignupViewModel(signupUseCase: signupUseCase)

            let dataService = DataAPIService()
            let dataRepo = DataRepositoryImpl(api: dataService)
            let fetchPostsUseCase = FetchPostsUseCase(repository: dataRepo)
            let postsViewModel = PostsViewModel(fetchPostsUseCase: fetchPostsUseCase)

            TabView {
                LoginView(viewModel: loginViewModel)
                    .tabItem {
                        Label("Login", systemImage: "person")
                    }

                SignupView(viewModel: signupViewModel)
                    .tabItem {
                        Label("Signup", systemImage: "person.badge.plus")
                    }

                PostView(viewModel: postsViewModel)
                    .tabItem {
                        Label("Posts", systemImage: "list.bullet.rectangle")
                    }
            }
        }
    }
}
