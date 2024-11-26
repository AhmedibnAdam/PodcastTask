//
//  HomeMainViewUITests.swift
//  PodCastTask
//
//  Created by Ahmad on 26/11/2024.
//


import XCTest
@testable import PodCastTask


final class HomeMainViewUITests: XCTestCase {
    private var app: XCUIApplication!

    override func setUpWithError() throws {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
    }

    func testTabViewNavigation() throws {
        // Verify the TabView loads correctly and navigates between tabs
        XCTAssertTrue(app.tabBars.buttons["Search"].exists)
        XCTAssertTrue(app.tabBars.buttons["Profile"].exists)
        
        // Navigate to Search tab and verify
        app.tabBars.buttons["Search"].tap()
        XCTAssertTrue(app.navigationBars["Search"].exists)

    }

}
