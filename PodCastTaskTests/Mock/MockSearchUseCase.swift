//
//  MockSearchUseCase.swift
//  PodCastTask
//
//  Created by Ahmad on 26/11/2024.
//


import Foundation
import Combine
import PodCastTask
import APINetworking

class MockSearchUseCase: SearchUseCaseProtocol {
    var shouldReturnError: Bool = false
    
    func search(query: String) async throws -> [SearchResultSection] {
        if shouldReturnError {
            throw NetworkRequestError.unknownError 
        }
        
        // Return some mock results
        return [SearchResultSection(name: "asd", type: "asdasd", contentType: "String? = nil", order: "String? = nil", content: [SearchResultSectionContent(podcastID: "String? = nil", name: "String? = nil", description: "String? = nil", avatar_url: "https://media.npr.org/assets/img/2022/09/22/consider-this_tile_npr-network-01_sq-96ca581b062bc4641008f69cf1e071394ce4c611.jpg", episodeCount: "String? = nil", duration: "43")]),
                SearchResultSection(name: "asd", type: "asdasd", contentType: "String? = nil", order: "String? = nil", content: [SearchResultSectionContent(podcastID: "String? = nil", name: "String? = nil", description: "String? = nil", avatar_url: "https://media.npr.org/assets/img/2022/09/22/consider-this_tile_npr-network-01_sq-96ca581b062bc4641008f69cf1e071394ce4c611.jpg", episodeCount: "String? = nil", duration: "43")])]
    }
}
