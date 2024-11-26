//
//  Configuration.swift
//  PodCastTask
//
//  Created by Ahmad on 21/11/2024.
//

import Foundation

class Configuration {
    static let shared = Configuration()
    
    private init() {}
    
    var serverURL: String {
        return ProcessInfo.processInfo.environment["SERVER_URL"] ?? ""
    }
    
    var rootURL: String {
        return ProcessInfo.processInfo.environment["ROOT_URL"] ?? ""
    }
    
    var imageBaseURL: String {
        return ProcessInfo.processInfo.environment["Image_Base_URL"] ?? ""
    }
    
    var searchBaseURL: String {
        return ProcessInfo.processInfo.environment["SEARCH_BASE_URL"] ?? ""
    }
}
