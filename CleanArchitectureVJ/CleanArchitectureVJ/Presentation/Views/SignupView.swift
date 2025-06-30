//
//  SignupView.swift
//  CleanArchitectureVJ
//
//  Created by Vijay on 26/06/25.
//

import SwiftUI

struct SignupView: View {
    @StateObject var viewModel: SignupViewModel
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Create Account")) {
                    TextField("Name", text: $viewModel.name)
                    TextField("Email", text: $viewModel.email)
                    SecureField("Password", text: $viewModel.password)
                }
                
                if let error = viewModel.errorMessage {
                    Text(error)
                        .foregroundColor(.red)
                }
                
                Button("Sign Up") {
                    Task {
                        await viewModel.signup()
                    }
                }
                
                if viewModel.isSignedUp {
                    Text("Signup Successful!")
                        .foregroundColor(.green)
                }
            }
            .navigationTitle("Signup")
        }
    }
}


#Preview {
    let dummyUseCase = SignupUseCase(repository: DummyAuthRepository())
    let vm = SignupViewModel(signupUseCase: dummyUseCase)
    SignupView(viewModel: vm)
}

class DummyAuthRepository: AuthRepository {
    func login(username: String, password: String) async throws -> User {
        return User(id: 1, username: username, email: "", token: "dummy")
    }
    
    func signup(name: String, email: String, password: String) async throws -> User {
        return User(id: 1, username: name, email: email, token: "dummy")
    }
}
