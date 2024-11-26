//
//  GetHomeSectionsUseCase.swift
//  PodCastTask
//
//  Created by Ahmad on 21/11/2024.
//

import SwiftUI
import Combine

public protocol GetHomeSectionsUseCase {
    func execute() -> AnyPublisher<[PodCastSection], Error>
}

final class GetHomeSectionsUseCaseImpl: GetHomeSectionsUseCase {
    private let apiService: HomeSectionsRepositoryProtocol
    private let databaseService: HomeSectionsDatabaseService
    
    init(apiService: HomeSectionsRepositoryProtocol = HomeSectionsRepository(),
         databaseService: HomeSectionsDatabaseService = HomeSectionsDatabaseService()) {
        self.apiService = apiService
        self.databaseService = databaseService
    }
    
    func execute() -> AnyPublisher<[PodCastSection], Error> {
        // First attempt to fetch data from the database
        return databaseService.getHomeSections()
            .flatMap { dbSections -> AnyPublisher<[PodCastSection], Error> in
                if dbSections.isEmpty {
                    return self.apiService.getHomeSections()
                        .map { $0 ?? [] }  
                        .mapError { $0 as Error }
                        .eraseToAnyPublisher()
                } else {
                    return Just(dbSections)
                        .setFailureType(to: Error.self)
                        .eraseToAnyPublisher()
                }
            }
            .eraseToAnyPublisher()
    }
}
