//
//  NetworkManager.swift
//  FlickrSearchApp
//
//  Created by DharmaMithra Tirunagari on 2/11/25.
//

import Foundation

protocol NetworkManaging {
    func fetchData<T: Decodable>(from url: URL) async throws -> T
}

class NetworkManager: NetworkManaging {
    static let shared = NetworkManager()
    
    private init() {} 
    
    func fetchData<T: Decodable>(from url: URL) async throws -> T {
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw NetworkError.badResponse
        }
        
        do {
            return try JSONDecoder().decode(T.self, from: data)
        } catch {
            throw NetworkError.decodingFailed
        }
    }
}
