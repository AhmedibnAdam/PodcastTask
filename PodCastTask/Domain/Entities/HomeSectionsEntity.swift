//
//  HomeSectionsEntity.swift
//  PodCastTask
//
//  Created by Ahmad on 21/11/2024.
//


import Foundation

// MARK: - Home
public struct HomeSectionsEntity: Codable{
    var sections: [PodCastSection]?
    var pagination: Pagination?
    
    enum CodingKeys: String, CodingKey {
           case sections
       }

    public init(from decoder: Decoder) throws {
           let container = try decoder.container(keyedBy: CodingKeys.self)
           
           let sections = try container.decodeIfPresent([PodCastSection].self, forKey: .sections) ?? []
           
           self.sections = sections
       }
}


// MARK: - Pagination
struct Pagination: Codable {
    var nextPage: String?
    var totalPages: Int?
}



// MARK: - Section
public struct PodCastSection: Codable, Equatable {
    var id: UUID?
    var name: String
    var contentType: String?
    var type: String?
    var order: Int?
    var content: [PodCastSectionContent]?
    
    init(id: UUID? = UUID(), name: String, contentType: String? = nil, type: String? = nil, order: Int? = nil, content: [PodCastSectionContent]? = nil) {
        self.id = id
        self.name = name
        self.contentType = contentType
        self.type = type
        self.order = order
        self.content = content
    }
    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decodeIfPresent(UUID.self, forKey: .id) ?? UUID()
        self.name = try container.decode(String.self, forKey: .name)
        self.contentType = try container.decodeIfPresent(String.self, forKey: .contentType)
        self.type = try container.decodeIfPresent(String.self, forKey: .type)
        self.order = try container.decodeIfPresent(Int.self, forKey: .order)
        self.content = try container.decodeIfPresent([PodCastSectionContent].self, forKey: .content)
    }
}

// Content.swift

// MARK: - Content
struct PodCastSectionContent: Codable, Hashable{
    var id: UUID?
    var name: String
    var podcastID, description: String?
    var avatar_url: String?
    var episodeCount, duration: Int?
    var language: String?
    var priority, popularityScore: Int?
    var score: Double?
    var podcastPopularityScore, podcastPriority: Int?
    var episodeID: String?
    var seasonNumber: String?
    var episodeType: String?
    var podcastName: String?
    var authorName: String?
    var number: String?
    var separatedAudioURL, audioURL: String?
    var releaseDate: Date?
    var chapters: [String?]?
    var paidIsEarlyAccess, paidIsNowEarlyAccess, paidIsExclusive: Bool?
    var paidTranscriptURL, freeTranscriptURL: String?
    var paidIsExclusivePartially: Bool?
    var paidExclusiveStartTime: Int?
    var paidEarlyAccessDate, paidEarlyAccessAudioURL, paidExclusivityType: String?
    var audiobookID: String?
    var articleID: String?
    
    init(id: UUID? = UUID(), name: String, podcastID: String? = nil, description: String? = nil, avatar_url: String? = nil, episodeCount: Int? = nil, duration: Int? = nil, language: String? = nil, priority: Int? = nil, popularityScore: Int? = nil, score: Double? = nil, podcastPopularityScore: Int? = nil, podcastPriority: Int? = nil, episodeID: String? = nil, seasonNumber: String? = nil, episodeType: String? = nil, podcastName: String? = nil, authorName: String? = nil, number: String? = nil, separatedAudioURL: String? = nil, audioURL: String? = nil, releaseDate: Date? = nil, chapters: [String?]? = nil, paidIsEarlyAccess: Bool? = nil, paidIsNowEarlyAccess: Bool? = nil, paidIsExclusive: Bool? = nil, paidTranscriptURL: String? = nil, freeTranscriptURL: String? = nil, paidIsExclusivePartially: Bool? = nil, paidExclusiveStartTime: Int? = nil, paidEarlyAccessDate: String? = nil, paidEarlyAccessAudioURL: String? = nil, paidExclusivityType: String? = nil, audiobookID: String? = nil, articleID: String? = nil) {
        self.id = id
        self.name = name
        self.podcastID = podcastID
        self.description = description
        self.avatar_url = avatar_url
        self.episodeCount = episodeCount
        self.duration = duration
        self.language = language
        self.priority = priority
        self.popularityScore = popularityScore
        self.score = score
        self.podcastPopularityScore = podcastPopularityScore
        self.podcastPriority = podcastPriority
        self.episodeID = episodeID
        self.seasonNumber = seasonNumber
        self.episodeType = episodeType
        self.podcastName = podcastName
        self.authorName = authorName
        self.number = number
        self.separatedAudioURL = separatedAudioURL
        self.audioURL = audioURL
        self.releaseDate = releaseDate
        self.chapters = chapters
        self.paidIsEarlyAccess = paidIsEarlyAccess
        self.paidIsNowEarlyAccess = paidIsNowEarlyAccess
        self.paidIsExclusive = paidIsExclusive
        self.paidTranscriptURL = paidTranscriptURL
        self.freeTranscriptURL = freeTranscriptURL
        self.paidIsExclusivePartially = paidIsExclusivePartially
        self.paidExclusiveStartTime = paidExclusiveStartTime
        self.paidEarlyAccessDate = paidEarlyAccessDate
        self.paidEarlyAccessAudioURL = paidEarlyAccessAudioURL
        self.paidExclusivityType = paidExclusivityType
        self.audiobookID = audiobookID
        self.articleID = articleID
    }
    
    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decodeIfPresent(UUID.self, forKey: .id) ?? UUID()
        self.name = try container.decode(String.self, forKey: .name)
        self.podcastID = try container.decodeIfPresent(String.self, forKey: .podcastID)
        self.description = try container.decodeIfPresent(String.self, forKey: .description)
        self.avatar_url = try container.decodeIfPresent(String.self, forKey: .avatar_url)
        self.episodeCount = try container.decodeIfPresent(Int.self, forKey: .episodeCount)
        self.duration = try container.decodeIfPresent(Int.self, forKey: .duration)
        self.language = try container.decodeIfPresent(String.self, forKey: .language)
        self.priority = try container.decodeIfPresent(Int.self, forKey: .priority)
        self.popularityScore = try container.decodeIfPresent(Int.self, forKey: .popularityScore)
        self.score = try container.decodeIfPresent(Double.self, forKey: .score)
        self.podcastPopularityScore = try container.decodeIfPresent(Int.self, forKey: .podcastPopularityScore)
        self.podcastPriority = try container.decodeIfPresent(Int.self, forKey: .podcastPriority)
        self.episodeID = try container.decodeIfPresent(String.self, forKey: .episodeID)
        self.seasonNumber = try container.decodeIfPresent(String.self, forKey: .seasonNumber)
        self.episodeType = try container.decodeIfPresent(String.self, forKey: .episodeType)
        self.podcastName = try container.decodeIfPresent(String.self, forKey: .podcastName)
        self.authorName = try container.decodeIfPresent(String.self, forKey: .authorName)
        self.number = try container.decodeIfPresent(String.self, forKey: .number)
        self.separatedAudioURL = try container.decodeIfPresent(String.self, forKey: .separatedAudioURL)
        self.audioURL = try container.decodeIfPresent(String.self, forKey: .audioURL)
        self.releaseDate = try container.decodeIfPresent(Date.self, forKey: .releaseDate)
        self.chapters = try container.decodeIfPresent([String?].self, forKey: .chapters)
        self.paidIsEarlyAccess = try container.decodeIfPresent(Bool.self, forKey: .paidIsEarlyAccess)
        self.paidIsNowEarlyAccess = try container.decodeIfPresent(Bool.self, forKey: .paidIsNowEarlyAccess)
        self.paidIsExclusive = try container.decodeIfPresent(Bool.self, forKey: .paidIsExclusive)
        self.paidTranscriptURL = try container.decodeIfPresent(String.self, forKey: .paidTranscriptURL)
        self.freeTranscriptURL = try container.decodeIfPresent(String.self, forKey: .freeTranscriptURL)
        self.paidIsExclusivePartially = try container.decodeIfPresent(Bool.self, forKey: .paidIsExclusivePartially)
        self.paidExclusiveStartTime = try container.decodeIfPresent(Int.self, forKey: .paidExclusiveStartTime)
        self.paidEarlyAccessDate = try container.decodeIfPresent(String.self, forKey: .paidEarlyAccessDate)
        self.paidEarlyAccessAudioURL = try container.decodeIfPresent(String.self, forKey: .paidEarlyAccessAudioURL)
        self.paidExclusivityType = try container.decodeIfPresent(String.self, forKey: .paidExclusivityType)
        self.audiobookID = try container.decodeIfPresent(String.self, forKey: .audiobookID)
        self.articleID = try container.decodeIfPresent(String.self, forKey: .articleID)
    }
    
}

enum SectionType: String, Codable {
    case square = "square"
    case twoLineGrid = "2_line_grid"
    case bigSquare = "big_square"
    case queue = "queue"
    case bigSquareWithSpace = "big square"
    
    enum CodingKeys: String, CodingKey {
        case square = "square"
        case twoLineGrid = "2_line_grid"
        case bigSquare = "big_square"
        case queue = "queue"
        case bigSquareWithSpace = "big square" 
    }
}

