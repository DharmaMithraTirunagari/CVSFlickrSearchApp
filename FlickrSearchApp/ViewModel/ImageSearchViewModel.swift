//
//  ImageSearchViewModel.swift
//  FlickrSearchApp
//
//  Created by DharmaMithra Tirunagari on 2/11/25.
//

import Foundation
import Combine

@MainActor
final class ImageSearchViewModel: ObservableObject {
    @Published var images: [FlickrImage] = []
    @Published var searchText: String = ""
    @Published var errorMessage: String?
    @Published var isLoading: Bool = false

    private let flickrService: FlickrServiceProtocol
    private var cancellables = Set<AnyCancellable>()

    init(flickrService: FlickrServiceProtocol = FlickrService()) {
        self.flickrService = flickrService
        setupSearchListener()
        Task { await fetchImages() } 
    }

    // Sets up Combine to listen to search input and fetch images with debouncing
    private func setupSearchListener() {
        $searchText
            .debounce(for: .milliseconds(500), scheduler: DispatchQueue.main)
            .removeDuplicates()
            .sink { [weak self] newQuery in
                guard let self = self else { return }
                Task { await self.fetchImages() }
            }
            .store(in: &cancellables)
    }

    /// Fetches images based on search text
    func fetchImages() async {
        let query = searchText.isEmpty ? Constants.API.defaultSearchQuery : searchText
        isLoading = true // ✅ Start loading
        errorMessage = nil // Clear previous errors

        do {
            let fetchedImages = try await flickrService.fetchImages(for: query)
            self.images = fetchedImages
        } catch {
            self.errorMessage = "Failed to load images. Please try again."
            self.images = [] // ✅ Clear images on failure
        }

        isLoading = false // ✅ Stop loading
    }
}
