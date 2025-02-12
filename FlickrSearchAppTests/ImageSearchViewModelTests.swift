//
//  ImageSearchViewModelTests.swift
//  FlickrSearchAppTests
//
//  Created by DharmaMithra Tirunagari on 2/11/25.
//

import XCTest
@testable import FlickrSearchApp

@MainActor
final class ImageSearchViewModelTests: XCTestCase {
    
    var viewModel: ImageSearchViewModel!
    var mockService: MockFlickrService!
    
    override func setUp() {
        super.setUp()
        mockService = MockFlickrService()
        viewModel = ImageSearchViewModel(flickrService: mockService)
    }
    
    override func tearDown() {
        super.tearDown()
        mockService = nil
        viewModel = nil
    }
    
    func testInitialState() {
        XCTAssertTrue(viewModel.images.isEmpty)
        XCTAssertFalse(viewModel.isLoading)
        XCTAssertNil(viewModel.errorMessage)
    }
    
    func testFetchImagesSuccess() async {
        await viewModel.fetchImages()
        
        XCTAssertEqual(viewModel.images.count, 2)
        XCTAssertEqual(viewModel.images.first?.title, "Sample 1")
        XCTAssertNil(viewModel.errorMessage)
    }
    
    func testFetchImages_Failure() async {
        mockService.shouldReturnError = true
        await viewModel.fetchImages()
        
        XCTAssertFalse(viewModel.isLoading)
        XCTAssertTrue(viewModel.images.isEmpty)
        XCTAssertNotNil(viewModel.errorMessage)
    }
    
    func testDefaultImagesOnEmptySearch() async {
        viewModel.searchText = ""

        await viewModel.fetchImages()
        
        XCTAssertFalse(viewModel.images.isEmpty, "Default images should load when search is empty")
    }
    
}
