//
//  Constants.swift
//  FlickrSearchApp
//
//  Created by DharmaMithra Tirunagari on 2/11/25.
//

struct Constants {
    struct UI {
        static let loadingText = "Loading..."
        static let searchPlaceholder = "Search images..."
        static let errorMessage = "Something went wrong. Please try again."
        static let errorTitle = "⚠️ Error"
        static let retryButtonTitle = "Retry"
        static let appTitle = "Flickr Search"
    }

    struct API {
        static let baseURL = "https://api.flickr.com/services/feeds/photos_public.gne"
        static let defaultParams = "?format=json&nojsoncallback=1&tags="
        static let defaultSearchQuery = "nature"
    }
}




