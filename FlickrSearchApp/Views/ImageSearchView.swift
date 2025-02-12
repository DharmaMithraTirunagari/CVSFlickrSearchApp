//
//  ContentView.swift
//  FlickrSearchApp
//
//  Created by DharmaMithra Tirunagari on 2/11/25.
//

import SwiftUI

struct ImageSearchView: View {
    @StateObject private var viewModel = ImageSearchViewModel()

    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 8) {
                Text(Constants.UI.appTitle)
                    .foregroundStyle(.blue)
                    .font(.system(size: 40, weight: .heavy))
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding(.horizontal, 20)
                    .accessibilityLabel("Flickr Search App")

                SearchBar(searchText: $viewModel.searchText) {
                    Task {
                        await viewModel.fetchImages()
                    }
                }

                if let errorMessage = viewModel.errorMessage {
                    ErrorView(message: errorMessage) {
                        Task {
                            await viewModel.fetchImages() 
                        }
                    }
                    .padding(.horizontal)
                    .transition(.opacity)
                } else if !viewModel.images.isEmpty {
                    ImageGridView(images: viewModel.images)
                        .transition(.opacity)
                } else if viewModel.isLoading {
                    ProgressView(Constants.UI.loadingText)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .accessibilityLabel("Loading images")
                } else {
                    Spacer()
                        .frame(height: 300)
                }
            }
            .padding(.top, 12)
            .navigationBarHidden(true)
            
        }
    }
}

#Preview {
    ImageSearchView()
}




