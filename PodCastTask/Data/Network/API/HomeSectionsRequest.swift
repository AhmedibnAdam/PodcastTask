//
//  HomeSectionsRequest.swift
//  PodCastTask
//
//  Created by Ahmad on 21/11/2024.
//


import Foundation
import APINetworking

/// Request Example
///
public struct HomeSectionsRequest: APIRequest {
    public typealias ResponseDataType = HomeSectionsEntity
    
    public var queryItems: [URLQueryItem]
    public var body: Data?
    public var endpoint: Endpoint
    public var headers: HTTPHeaders?
    public var httpMethod: HTTPMethod
    
    public init(
        queryItems: [URLQueryItem] = [],
        body: Data? = nil,
        endpoint: Endpoint = .homeSections,
        headers: HTTPHeaders? = .contentTypeApplicationJSON,
        httpMethod: HTTPMethod = .get
    ) {
        self.queryItems = queryItems
        self.body = body
        self.endpoint = endpoint
        self.headers = headers
        self.httpMethod = httpMethod
    }
    
    public var decoder: JSONDecoder {
        let decoder = JSONDecoder()
        return decoder
    }
}


public enum Endpoints {
    public static let apiEndpoint = Configuration.shared.serverURL
    public static let searchEndpoint = Configuration.shared.searchBaseURL
}

public extension APIClient {
  static let live = Self(networkDispatcher: { .live })
  static let noop = Self(networkDispatcher: { .noop })
}

public extension NetworkDispatcher {
  static let live = Self(urlSession: { .shared })
  static let noop = Self(urlSession: { URLSession(configuration: .default) })
}


import Foundation
import APINetworking

/// Request Example
///
public struct SearchRequest: APIRequest {
    public typealias ResponseDataType = HomeSectionsEntity
    
    public var queryItems: [URLQueryItem]
    public var body: Data?
    public var endpoint: Endpoint
    public var headers: HTTPHeaders?
    public var httpMethod: HTTPMethod
    
    public init(
        queryItems: [URLQueryItem] = [],
        body: Data? = nil,
        endpoint: Endpoint = .searchSections,
        headers: HTTPHeaders? = .contentTypeApplicationJSON,
        httpMethod: HTTPMethod = .get
    ) {
        self.queryItems = queryItems
        self.body = body
        self.endpoint = endpoint
        self.headers = headers
        self.httpMethod = httpMethod
    }
    
    public var decoder: JSONDecoder {
        let decoder = JSONDecoder()
        return decoder
    }
}


public extension Endpoint {
    static let homeSections = Endpoint(baseUrl: Endpoints.apiEndpoint, path: "/home_sections")
    static let searchSections = Endpoint(baseUrl: Endpoints.searchEndpoint, path: "/m1/735111-711675-default/search")
}


