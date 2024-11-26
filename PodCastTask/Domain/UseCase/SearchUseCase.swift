//
//  SearchUseCase.swift
//  PodCastTask
//
//  Created by Ahmad on 24/11/2024.
//

import SwiftUI
import Combine

public protocol SearchUseCaseProtocol {
    func search(query: String) async throws -> [SearchResultSection]
}

struct SearchUseCase: SearchUseCaseProtocol {
    private let repository: SearchRepositoryProtocol

    init(repository: SearchRepositoryProtocol) {
        self.repository = repository
    }

    func search(query: String) async throws -> [SearchResultSection] {
        guard !query.isEmpty else { return [] }
        return try await repository.search(query: query)
    }
}
