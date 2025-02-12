//
//  MockFlickrService.swift
//  FlickrSearchApp
//
//  Created by DharmaMithra Tirunagari on 2/11/25.
//

import Foundation

class MockFlickrService: FlickrServiceProtocol {
    var shouldReturnError: Bool = false

    func fetchImages(for query: String) async throws -> [FlickrImage] {
        if shouldReturnError {
            throw NetworkError.badResponse
        }
        
        return [
            FlickrImage(
                title: "Sample 1",
                link: "https://flickr.com/sample1",
                media: Media(mediaURL: "https://example.com/sample1.jpg"),
                description: "<p>sample1</p>",
                published: "2025-02-11T12:00:00Z",
                author: "(\"DharmaMithra\")"
            ),
            FlickrImage(
                title: "Sample 2",
                link: "https://flickr.com/sample2",
                media: Media(mediaURL: "https://example.com/sample2.jpg"),
                description: "<p>sample2</p>",
                published: "2025-02-11T12:00:00Z",
                author: "(\"DharmaMithra\")"
            )
        ]
    }
}

