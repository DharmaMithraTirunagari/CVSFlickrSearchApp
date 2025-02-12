//
//  FlickrService.swift
//  FlickrSearchApp
//
//  Created by DharmaMithra Tirunagari on 2/11/25.
//

import Foundation

protocol FlickrServiceProtocol {
    func fetchImages(for query: String) async throws -> [FlickrImage]
}

class FlickrService: FlickrServiceProtocol {
    private let networkManager: NetworkManaging
    
    init(networkManager: NetworkManaging = NetworkManager.shared) {
        self.networkManager = networkManager
    }
    
    func fetchImages(for query: String) async throws -> [FlickrImage] {
        guard let url = URL(string: Constants.API.baseURL + Constants.API.defaultParams + query) else {
            throw NetworkError.invalidURL
        }
        
        let flickrResponse: FlickrResponse = try await networkManager.fetchData(from: url)
        return flickrResponse.items
    }
}


