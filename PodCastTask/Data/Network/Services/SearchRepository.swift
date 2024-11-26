//
//  SearchRepositoryProtocol.swift
//  PodCastTask
//
//  Created by Ahmad on 24/11/2024.
//

import Combine
import Foundation
import APINetworking

protocol SearchRepositoryProtocol {
    func search(query: String) async throws -> [SearchResultSection]
}

struct SearchRepository: SearchRepositoryProtocol {
    private let dispatcher: NetworkDispatcher

    init(dispatcher: NetworkDispatcher = NetworkDispatcher(urlSession: { URLSession.shared })) {
        self.dispatcher = dispatcher
    }

    func search(query: String) async throws -> [SearchResultSection] {

        let request = SearchRequest(queryItems: [URLQueryItem(name: "q", value: query)])
        
        do {
            let data = try await dispatcher.dispatchAsync(request: request.makeRequest())
            
            let response = try JSONDecoder().decode(SearchResult.self, from: data)
            
            return response.sections ?? []
            
        } catch let error as DecodingError {
            switch error {
            case .dataCorrupted(let context):
                throw CustomError.decodingFailed("Data corrupted: \(context.debugDescription)")
            case .keyNotFound(let key, let context):
                throw CustomError.decodingFailed("Missing key: \(key.stringValue) - \(context.debugDescription)")
            case .typeMismatch(let type, let context):
                throw CustomError.decodingFailed("Type mismatch for \(type) - \(context.debugDescription)")
            case .valueNotFound(let type, let context):
                throw CustomError.decodingFailed("Value not found for \(type) - \(context.debugDescription)")
            @unknown default:
                throw CustomError.decodingFailed("Unknown decoding error: \(error.localizedDescription)")
            }
        } catch let error {
            throw CustomError.networkError(error.localizedDescription)
        }
    }
}


enum CustomError: Error {
    case decodingFailed(String)
    case networkError(String)
}
