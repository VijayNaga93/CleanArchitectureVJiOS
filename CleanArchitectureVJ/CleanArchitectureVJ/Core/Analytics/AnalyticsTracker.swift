//
//  AnalyticsTracker.swift
//  CleanArchitectureVJ
//
//  Created by Vijay on 27/06/25.
//

import Foundation

public protocol AnalyticsTracker {
    func log(event: String, parameters: [String: Any]?)
}



