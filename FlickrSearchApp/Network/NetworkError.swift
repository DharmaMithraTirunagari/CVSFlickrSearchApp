//
//  NetworkError.swift
//  FlickrSearchApp
//
//  Created by DharmaMithra Tirunagari on 2/11/25.
//

import Foundation

enum NetworkError: Error {
    case invalidURL
    case badResponse
    case decodingFailed
    
    var localizedDescription: String {
        switch self {
        case .invalidURL:
            return "The URL is invalid."
        case .badResponse:
            return "Received a bad response from the server."
        case .decodingFailed:
            return "Failed to decode the response."
        }
    }
}
