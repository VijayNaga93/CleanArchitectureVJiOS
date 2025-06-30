//
//  LoginView.swift
//  CleanArchitectureVJ
//
//  Created by Vijay on 26/06/25.
//

import SwiftUI

struct LoginView: View {
    @StateObject var viewModel: LoginViewModel
    
    var body: some View {
        VStack {
            TextField("Username", text: $viewModel.username)
            SecureField("Password", text: $viewModel.password)
            Button("Login") {
                Task {
                    await viewModel.login()
                }
            }
            if !viewModel.errorMessage.isEmpty {
                Text(viewModel.errorMessage).foregroundColor(.red)
            }
        }
        .padding()
    }
}

#Preview {
    let apiService = AuthAPIService()
    let repository = AuthRepositoryImpl(apiService: apiService)
    let analytics = ConsoleLogger()
    let useCase = LoginUseCase(repository: repository, analytics: analytics)
    let viewModel = LoginViewModel(loginUseCase: useCase)
    
    LoginView(viewModel: viewModel)
}
