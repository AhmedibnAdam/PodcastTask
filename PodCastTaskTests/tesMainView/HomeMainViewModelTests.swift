//
//  HomeMainViewModelTests.swift
//  PodCastTaskTests
//
//  Created by Ahmad on 26/11/2024.
//

import XCTest
import Combine
@testable import PodCastTask

final class HomeMainViewModelTests: XCTestCase {
    var viewModel: HomeMainViewModel!
    var mockGetHomeSectionsUseCase: MockGetHomeSectionsUseCase!
    var cancellables: Set<AnyCancellable>!

    override func setUp() {
        super.setUp()
        mockGetHomeSectionsUseCase = MockGetHomeSectionsUseCase()
        viewModel = HomeMainViewModel(getHomeSectionsUseCase: mockGetHomeSectionsUseCase)
        cancellables = []
    }

    override func tearDown() {
        viewModel = nil
        mockGetHomeSectionsUseCase = nil
        cancellables = nil
        super.tearDown()
    }

    func testGetHomeSections_Success() {
        let mockSections = [PodCastSection(name: "ahmed",
                                           contentType: "Queue",
                                           type: "Queue",
                                           order: 5,
                                           content: [PodCastSectionContent(name: "fdfd",
                                                                           podcastID: "dfdfdf",
                                                                           description: "l",
                                                                           avatar_url: "https://media.npr.org/assets/img/2022/09/22/consider-this_tile_npr-network-01_sq-96ca581b062bc4641008f69cf1e071394ce4c611.jpg",
                                                                           episodeCount: 5,
                                                                           duration: 55)])]
        
        mockGetHomeSectionsUseCase.result = .success(mockSections)
        viewModel = HomeMainViewModel(getHomeSectionsUseCase: mockGetHomeSectionsUseCase)

            let expectation = XCTestExpectation(description: "Home sections fetched successfully")
            
        viewModel.$homeSections
               .dropFirst() // Skip the initial empty value
               .sink { sections in
                   // Assert
                   XCTAssertEqual(sections, mockSections)
                   expectation.fulfill()
               }
               .store(in: &cancellables)
           
           viewModel.getHomeSections()
           
           wait(for: [expectation], timeout: 1.0)
    }

    func testGetHomeSections_Failure() {
        let mockError = NSError(domain: "TestError", code: 1, userInfo: [NSLocalizedDescriptionKey: "Mock error message"])
        mockGetHomeSectionsUseCase.result = .failure(mockError)
        
        let expectation = XCTestExpectation(description: "Error message set on failure")
        
        viewModel.$errorMessage
            .dropFirst() 
            .sink { errorMessage in
                XCTAssertEqual(errorMessage, mockError.localizedDescription)
                expectation.fulfill()
            }
            .store(in: &cancellables)
        
        viewModel.getHomeSections()
        
        wait(for: [expectation], timeout: 1.0)
    }
}
