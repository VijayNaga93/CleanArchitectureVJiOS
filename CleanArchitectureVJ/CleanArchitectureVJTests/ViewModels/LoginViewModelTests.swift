//
//  LoginViewModelTests.swift
//  CleanArchitectureVJTests
//
//  Created by Vijay on 28/06/25.
//

import Foundation
import XCTest
import Combine
import CleanArchitectureVJ

final class LoginViewModelTests: XCTestCase {
    func test_login_success_clearsErrorMessage() async {
        let repo = MockAuthRepository(result: .success(User(id: 1, username: "test", email: "", token: "token")))
        let analyticsTracker = MockAnalyticsTracker()
        let useCase = LoginUseCase(repository: repo, analytics: analyticsTracker)
        let viewModel = await LoginViewModel(loginUseCase: useCase)
        
        await MainActor.run {
            viewModel.errorMessage = "Old error"
        }
           
        
        let expectation = XCTestExpectation(description: "Wait for errorMessage to clear")
        let cancellable = await viewModel.$errorMessage.dropFirst().sink { newValue in
            if newValue.isEmpty {
                expectation.fulfill()
            }
        }
        
        await viewModel.login()
        wait(for: [expectation], timeout: 3.0)
        cancellable.cancel()
    }
    
    func test_login_failure_setsErrorMessage() async {
        let repo = MockAuthRepository(result: .failure(LoginError.invalidCredentials))
        let analyticsTracker = MockAnalyticsTracker()
        let useCase = LoginUseCase(repository: repo, analytics: analyticsTracker)
        let viewModel = await LoginViewModel(loginUseCase: useCase)
        
        let expectation = XCTestExpectation(description: "Wait for errorMessage to be set")
        let cancellable = await viewModel.$errorMessage.dropFirst().sink { newValue in
            if newValue == LoginError.invalidCredentials.localizedDescription {
                expectation.fulfill()
            }
        }
        
        await viewModel.login()
        wait(for: [expectation], timeout: 3.0)
        cancellable.cancel()
    }
}
