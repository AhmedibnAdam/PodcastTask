//
//  PodcastSectionsViewModel.swift
//  PodCastTask
//
//  Created by Ahmad on 22/11/2024.
//

import SwiftUI
import Combine

final class PodcastSectionsViewModel : ObservableObject {
    @Published var homeSections: [PodCastSection]
    @Published var errorMessage: String?
    private var cancellables = Set<AnyCancellable>()

    init(homeSections: [PodCastSection], errorMessage: String? = nil, cancellables: Set<AnyCancellable> = Set<AnyCancellable>()) {
        self.homeSections = homeSections
        self.errorMessage = errorMessage
        self.cancellables = cancellables
    }
}
