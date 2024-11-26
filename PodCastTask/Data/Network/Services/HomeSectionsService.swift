//
//  HomeSectionsService.swift
//  PodCastTask
//
//  Created by Ahmad on 21/11/2024.
//

import Combine
import Foundation
import APINetworking

// MARK: Interface

public protocol HomeSectionsRepositoryProtocol {
    func getHomeSections() -> AnyPublisher<[PodCastSection]?, NSError>
}

public struct HomeSectionsRepository: HomeSectionsRepositoryProtocol {
    private let apiClient: APIClient

    public init(apiClient: APIClient = .live) {
        self.apiClient = apiClient
    }

    public func getHomeSections() -> AnyPublisher<[PodCastSection]?, NSError> {
        let request = HomeSectionsRequest()

        return apiClient.dispatch(request)
            .decode(
                type: HomeSectionsEntity.self,
                decoder: request.decoder
            )
            .map(\.sections)
            .mapError { $0 as NSError }
            .eraseToAnyPublisher()
    }
}


