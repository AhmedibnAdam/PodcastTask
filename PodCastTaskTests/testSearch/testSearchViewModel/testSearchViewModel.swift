//
//  testSearchViewModel.swift
//  PodCastTaskTests
//
//  Created by Ahmad on 26/11/2024.
//

import XCTest
@testable import PodCastTask
import Combine

class SearchViewModelTests: XCTestCase {
    
    var viewModel: SearchViewModel!
    var mockUseCase: MockSearchUseCase!
    
    override func setUp() {
        super.setUp()
        mockUseCase = MockSearchUseCase()
        viewModel = SearchViewModel(useCase: mockUseCase)
    }
    
    override func tearDown() {
        viewModel = nil
        mockUseCase = nil
        super.tearDown()
    }
    
    func testPerformSearch_emptyQuery_shouldClearResults() {
        viewModel.query = ""
        XCTAssertTrue(viewModel.results.isEmpty)
    }
    
    func testPerformSearch_success_shouldUpdateResults() async {
        viewModel.query = "Search Query"
            
            mockUseCase.shouldReturnError = false
            
            let expectation = XCTestExpectation(description: "Perform search")
            
            Task {
                await viewModel.performSearch(for: "Search Query")
                expectation.fulfill()
            }
            
            // Wait for the expectation to be fulfilled
            wait(for: [expectation], timeout: 5.0) 
            XCTAssertEqual(viewModel.results.count, 2)
    }
    
    func testPerformSearch_error_shouldSetErrorMessage() async {
        // Simulate a valid query
        viewModel.query = "Search Query"
        let expectation = XCTestExpectation(description: "An unknown error occurred.")

        // Simulate an error
        mockUseCase.shouldReturnError = true
        
        wait(for: [expectation], timeout: 5.0)

        XCTAssertNotNil(viewModel.errorMessage)
        XCTAssertEqual(viewModel.errorMessage, "Error: The operation couldn’t be completed. (APINetworking.NetworkRequestError error 9.)")
    }
    
    
}
