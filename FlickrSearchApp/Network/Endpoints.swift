//
//  APIConstants.swift
//  FlickrSearchApp
//
//  Created by DharmaMithra Tirunagari on 2/11/25.
//

import Foundation

struct Endpoints {
    static let flickrBaseURL = Constants.API.baseURL
    static let flickrDefaultParams = Constants.API.defaultParams
    
    static func flickrSearch(query: String) -> String {
        return flickrBaseURL + flickrDefaultParams + query
    }
}


