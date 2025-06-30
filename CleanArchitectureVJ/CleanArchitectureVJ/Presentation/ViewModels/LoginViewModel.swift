//
//  LoginViewModel.swift
//  CleanArchitectureVJ
//
//  Created by Vijay on 26/06/25.
//

import Foundation

@MainActor
public final class LoginViewModel: ObservableObject {
    @Published var username = ""
    @Published var password = ""
    @Published public var errorMessage = ""

    private let loginUseCase: LoginUseCase

   public init(loginUseCase: LoginUseCase) {
        self.loginUseCase = loginUseCase
    }

   public func login() async {
        do {
            let user = try await loginUseCase.execute(username: username, password: password)
            print("Logged in: \(user.username ?? "")")
        } catch let error as LoginError {
            errorMessage = error.localizedDescription
        } catch {
            errorMessage = "Unexpected error..."
        }
    }
    
}
