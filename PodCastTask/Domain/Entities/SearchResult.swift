//
//  SearchResult.swift
//  PodCastTask
//
//  Created by Ahmad on 24/11/2024.
//

import Foundation

// MARK: - SearchResult
public struct SearchResult: Codable {
    var sections: [SearchResultSection]?
}



// MARK: - Section
public struct SearchResultSection: Codable, Equatable {
    
    var id: UUID?
    var name, type, contentType, order: String?
    var content: [SearchResultSectionContent]?
    
    public init(id: UUID? = nil, name: String? = nil, type: String? = nil, contentType: String? = nil, order: String? = nil, content: [SearchResultSectionContent]? = nil) {
        self.id = id
        self.name = name
        self.type = type
        self.contentType = contentType
        self.order = order
        self.content = content
    }
    
    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decodeIfPresent(UUID.self, forKey: .id) ?? UUID()
        self.name = try container.decodeIfPresent(String.self, forKey: .name)
        self.type = try container.decodeIfPresent(String.self, forKey: .type)
        self.contentType = try container.decodeIfPresent(String.self, forKey: .contentType)
        self.order = try container.decodeIfPresent(String.self, forKey: .order)
        self.content = try container.decodeIfPresent([SearchResultSectionContent].self, forKey: .content)
    }
}


// MARK: - Content
public struct SearchResultSectionContent: Codable, Equatable {
    var podcastID, name, description: String?
    var avatar_url: String?
    var episodeCount, duration, language, priority: String?
    var popularityScore, score: String?
    
    public init(podcastID: String? = nil, name: String? = nil, description: String? = nil, avatar_url: String? = nil, episodeCount: String? = nil, duration: String? = nil, language: String? = nil, priority: String? = nil, popularityScore: String? = nil, score: String? = nil) {
        self.podcastID = podcastID
        self.name = name
        self.description = description
        self.avatar_url = avatar_url
        self.episodeCount = episodeCount
        self.duration = duration
        self.language = language
        self.priority = priority
        self.popularityScore = popularityScore
        self.score = score
    }
}

extension SearchResultSection {
    func toPodCastSection() -> PodCastSection {
        let content = self.content?.map {
            PodCastSectionContent(
                id: UUID(),
                name: $0.name ?? "",
                avatar_url: $0.avatar_url,
                episodeCount: Int($0.episodeCount ?? "0"),
                duration: Int($0.duration ?? "0")
            )
        } ?? []

        return PodCastSection(
            name: self.name ?? "",
            contentType: self.contentType,
            type: self.type,
            order: Int(self.order ?? "0"),
            content: content
        )
    }
}
