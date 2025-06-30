//
//  LoginUseCaseTests.swift
//  CleanArchitectureVJTests
//
//  Created by Vijay on 28/06/25.
//

import Foundation
import CleanArchitectureVJ
import XCTest


final class LoginUseCaseTests: XCTestCase {
    func test_login_success_returnsUser() async throws {
        let repo = MockAuthRepository(result: .success(User(id: 1, username: "test", email: "", token: "abc")))
        let analyticsTracker = MockAnalyticsTracker()
        let useCase = LoginUseCase(repository: repo, analytics: analyticsTracker)
        
        let user = try await useCase.execute(username: "test", password: "pass123")
        
        XCTAssertEqual(user.username, "test")
    }
    
    func test_login_failure_throwsError() async {
        let repo = MockAuthRepository(result: .failure(LoginError.weakPassword))
        let analyticsTracker = MockAnalyticsTracker()
        let useCase = LoginUseCase(repository: repo, analytics: analyticsTracker)
        
        do {
            _ = try await useCase.execute(username: "x", password: "y")
            XCTFail("Expected to throw")
        } catch let error as LoginError {
            XCTAssertEqual(error, .weakPassword)
        } catch {
            XCTFail("Wrong error type")
        }
    }
}
