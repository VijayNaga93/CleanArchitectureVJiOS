//
//  AppError.swift
//  CleanArchitectureVJ
//
//  Created by Vijay on 27/06/25.
//

import Foundation

enum AppNetworkError: Error {
    case noInternet
    case badUrl
    case badStatusCode(Int)
    case apiError(String)
    case jsonDecodingError(String)
    case unknown(String)
    
    var description: String {
        switch self {
        case .noInternet:
            return "No Internet connection"
        case .badUrl:
            return "The given URL having issue"
        case .badStatusCode(let code):
            return "Server returned \(code)"
        case .apiError(let message):
            return "The api got some error from the server"
        case .jsonDecodingError(let message):
            return "The JSON model which is mapped to the response is not in correct format"
        case .unknown(let message): return "Unknown error: \(message)"
        }
    }
}

