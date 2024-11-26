//
//  HomeSectionsDatabaseService.swift
//  PodCastTask
//
//  Created by Ahmad on 21/11/2024.
//

import Combine
import SwiftUI

// HomeSectionsDatabaseService - Simulating database fetch
final class HomeSectionsDatabaseService {
    
    // Fetch sections from the database (simulated)
    func getHomeSections() -> AnyPublisher<[PodCastSection], Error> {
        // Simulating a delay to mimic a database fetch
        return Future<[PodCastSection], Error> { promise in
            DispatchQueue.global().asyncAfter(deadline: .now() + 1) {
                // Return data from "database" (mock in-memory data)
                promise(.success([]))
            }
        }
        .eraseToAnyPublisher()
    }
    
   
}
