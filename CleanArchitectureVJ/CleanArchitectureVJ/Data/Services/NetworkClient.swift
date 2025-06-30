//
//  NetworkClient.swift
//  CleanArchitectureVJ
//
//  Created by Vijay on 27/06/25.
//

import Foundation

// Need to enhance this logic - like prepare and sending URLRequest.
final class NetworkClient {
    private let tokenStore: TokenStore

    init(tokenStore: TokenStore = KeychainTokenStore()) {
        self.tokenStore = tokenStore
    }

    func request<T: Decodable>(url: URL, responseType: T.Type) async -> Result<T, AppNetworkError> {
        var request = URLRequest(url: url)
        if let token = try? tokenStore.getToken() {
            request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        }

        do {
            let (data, response) = try await URLSession.shared.data(for: request)
            let result = try JSONDecoder().decode(T.self, from: data)
            return .success(result)
        } catch {
            return .failure(.apiError(error.localizedDescription))
        }
    }
}
