//
//  MockFlickrServiceTests.swift
//  FlickrSearchAppTests
//
//  Created by DharmaMithra Tirunagari on 2/11/25.
//

import XCTest
@testable import FlickrSearchApp

final class MockFlickrServiceTests: XCTestCase {
    
    var mockService: MockFlickrService!

    override func setUp()  {
        super.setUp()
        mockService = MockFlickrService()
    }

    override func tearDown()  {
        super.tearDown()
        mockService = nil
    }

    func testFetchImages_Success() async throws {
            let images = try await mockService.fetchImages(for: "nature")

            XCTAssertEqual(images.count, 2, "Mock should return exactly 2 images.")
            XCTAssertEqual(images.first?.title, "Sample 1", "First image title should match Sample 1.")
            XCTAssertEqual(images.last?.title, "Sample 2", "Second image title should match Sample 2.")
        }

    func testFetchImages_Failure() async {
            mockService.shouldReturnError = true

            do {
                _ = try await mockService.fetchImages(for: "nature")
                XCTFail("Expected error to be thrown, but function completed successfully.")
            } catch {
                XCTAssertEqual(error as? NetworkError, NetworkError.badResponse, "Error should be badResponse.")
            }
        }

}
