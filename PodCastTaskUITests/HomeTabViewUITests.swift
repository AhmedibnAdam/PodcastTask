//
//  HomeTabViewUITests.swift
//  PodCastTask
//
//  Created by Ahmad on 26/11/2024.
//


import XCTest
@testable import PodCastTask


final class HomeTabViewUITests: XCTestCase {

    let app = XCUIApplication()

    override func setUpWithError() throws {
        continueAfterFailure = false
        app.launch()
    }

    func testHomeTabViewDisplaysLoadingIndicator() {
        let homeTab = app.tabBars.buttons["Home"]
        XCTAssertTrue(homeTab.exists)

    }
    
   

    func testNavigationBarItemsExist() {
        let homeTab = app.tabBars.buttons["Home"]
        XCTAssertTrue(homeTab.exists)
        homeTab.tap()
        
        let welcomeMessage = app.staticTexts["Welcome, Adam"]
        let notificationButton = app.buttons.matching(identifier: "NotificationButton")
        
        XCTAssertTrue(welcomeMessage.exists)
        XCTAssertTrue(notificationButton.element.exists)
    }
}
