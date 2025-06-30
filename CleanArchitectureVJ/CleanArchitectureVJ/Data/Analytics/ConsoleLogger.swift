//
//  ConsoleLogger.swift
//  CleanArchitectureVJ
//
//  Created by Vijay on 27/06/25.
//

import Foundation

class ConsoleLogger: AnalyticsTracker {
    func log(event: String, parameters: [String : Any]?) {
        print("[Analytics] Event: \(event), Parameters: \(parameters ?? [:])")
    }
}
