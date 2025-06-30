//
//  AuthAPIService.swift
//  CleanArchitectureVJ
//
//  Created by Vijay on 26/06/25.
//

import Foundation

final class DataAPIService
{
    
    //    Hitting api and filtering error logic belongs here because it’s doing the actual API call and parsing response — which is infrastructure-level work.
    func fetchPosts() async -> Result<[PostDTO], AppNetworkError> {
        
        do {
            let (data, response) = try await URLSession.shared.data(from: URL(string: "https://jsonplaceholder.typicode.com/posts")!)
            
            guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                return .failure(.apiError("Invalid status code: \((response as? HTTPURLResponse)?.statusCode ?? 0)"))
            }
            
            let jsonModel = try JSONDecoder().decode([PostDTO].self, from: data)
            return .success(jsonModel)
        } catch let error as DecodingError {
            return .failure(.jsonDecodingError(error.localizedDescription))
        } catch let error {
            return .failure(.apiError(error.localizedDescription))
        }
    }
    
    func fetchPostDetail(postId: Int) async -> Result<PostDTO, AppNetworkError> {
        do {
            let url = URL(string: "https://jsonplaceholder.typicode.com/posts/\(postId)")!
            let (data, response) = try await URLSession.shared.data(from: url)
            
            guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                return .failure(.apiError("Invalid status code: \((response as? HTTPURLResponse)?.statusCode ?? 0)"))
            }
            
            let postDTO = try JSONDecoder().decode(PostDTO.self, from: data)
            return .success(postDTO)
        } catch let error as DecodingError {
            return .failure(.jsonDecodingError(error.localizedDescription))
        } catch {
            return .failure(.apiError(error.localizedDescription))
        }
    }
    
}
