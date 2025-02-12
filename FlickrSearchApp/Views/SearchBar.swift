//
//  SearchBar.swift
//  FlickrSearchApp
//
//  Created by DharmaMithra Tirunagari on 2/11/25.
//

import SwiftUI

struct SearchBar: View {
    @Binding var searchText: String
    var onSearch: () -> Void

    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(.gray)
                .accessibilityHidden(true)
            
            TextField(Constants.UI.searchPlaceholder, text: $searchText, onCommit: onSearch)
                .padding(.vertical, 8)
                .foregroundColor(.black)
                .accessibilityLabel("Search images")
                .accessibilityHint("Enter a keyword to search for images")

            if !searchText.isEmpty {
                Button(action: {
                    searchText = ""
                    onSearch()
                }) {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundColor(.gray)
                }
                .accessibilityLabel("Clear search text")
                .accessibilityHint("Clears the entered search query")
            }
        }
        .padding(.horizontal, 12)
        .background(Color(.systemGray5))
        .cornerRadius(12)
        .padding(.horizontal)
    }
}





