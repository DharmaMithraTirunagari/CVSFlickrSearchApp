//
//  FlickrSearchAppUITests.swift
//  FlickrSearchAppUITests
//
//  Created by DharmaMithra Tirunagari on 2/11/25.
//

import XCTest

final class FlickrSearchAppUITests: XCTestCase {

    var app: XCUIApplication!

    override func setUpWithError() throws {
        continueAfterFailure = false // Stop on failure
        app = XCUIApplication()
        app.launch()
    }

    override func tearDownWithError() throws {
        app = nil
    }

    func testSearchBarExists() {
        let searchBar = app.textFields["Search images..."] // Ensure placeholder matches
        XCTAssertTrue(searchBar.exists, "Search bar should be visible on launch")
    }

    func testSearchUpdatesImages() {
        let searchBar = app.textFields["Search images..."]
        XCTAssertTrue(searchBar.exists, "Search bar should exist")

        searchBar.tap()
        searchBar.typeText("cat")

        let firstImage = app.images.element(boundBy: 0) // Check the first image
        let exists = firstImage.waitForExistence(timeout: 5)
        XCTAssertTrue(exists, "Images should be updated after searching")
    }

    func testClearingSearchRestoresDefaultImages() {
        let searchBar = app.textFields["Search images..."]
        XCTAssertTrue(searchBar.exists, "Search bar should exist")

        searchBar.tap()
        searchBar.typeText("cat")

        let firstImage = app.images.element(boundBy: 0)
        XCTAssertTrue(firstImage.waitForExistence(timeout: 5), "Search results should appear")

        if app.buttons["Clear Search"].exists {
            app.buttons["Clear Search"].tap()
        } else {
            searchBar.doubleTap()
            app.keys["delete"].tap()
        }

        let defaultImage = app.images.element(boundBy: 0)
        XCTAssertTrue(defaultImage.waitForExistence(timeout: 5), "Default images should load when search is cleared")
    }


    @MainActor
    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
