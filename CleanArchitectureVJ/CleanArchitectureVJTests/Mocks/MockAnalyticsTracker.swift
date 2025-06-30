//
//  MockAnalyticsTracker.swift
//  CleanArchitectureVJTests
//
//  Created by Vijay on 29/06/25.
//

import Foundation
import CleanArchitectureVJ

final class MockAnalyticsTracker: AnalyticsTracker {
    func log(event: String, parameters: [String : Any]?) {
        print("[Analytics] Event: \(event), Parameters: \(parameters ?? [:])")
    }
}


