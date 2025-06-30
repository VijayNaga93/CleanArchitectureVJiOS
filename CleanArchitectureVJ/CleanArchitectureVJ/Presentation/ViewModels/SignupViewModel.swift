//
//  SignupViewModel.swift
//  CleanArchitectureVJ
//
//  Created by Vijay on 26/06/25.
//

import Foundation

@MainActor
class SignupViewModel: ObservableObject {
    @Published var name: String = ""
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var errorMessage: String?
    @Published var isSignedUp: Bool = false

    private let signupUseCase: SignupUseCase

    init(signupUseCase: SignupUseCase) {
        self.signupUseCase = signupUseCase
    }

    func signup() async {
        errorMessage = nil
        do {
            let user = try await signupUseCase.execute(name: name, email: email, password: password)
            print("Signup success: \(user)")
            isSignedUp = true
        } catch let err {
            errorMessage = err.localizedDescription
            isSignedUp = false
        }
    }
}
