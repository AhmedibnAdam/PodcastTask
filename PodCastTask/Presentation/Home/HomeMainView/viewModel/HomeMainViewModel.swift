//
//  HomeMainViewModel.swift
//  PodCastTask
//
//  Created by Ahmad on 21/11/2024.
//


import SwiftUI
import Combine

final class HomeMainViewModel: ObservableObject {
    @Published var homeSections: [PodCastSection] = []
    @Published var errorMessage: String?
    @Published var isLoading: Bool = false
    
    private var cancellables = Set<AnyCancellable>()
    let getHomeSectionsUseCase: GetHomeSectionsUseCase
    
    init(getHomeSectionsUseCase: GetHomeSectionsUseCase) {
        self.getHomeSectionsUseCase = getHomeSectionsUseCase
    }
    
    func getHomeSections() {
        isLoading = true
        getHomeSectionsUseCase.execute()
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                self.isLoading = false
                if case .failure(let error) = completion {
                    self.errorMessage = error.localizedDescription
                    print(error.localizedDescription)
                }
            }, receiveValue: { homeSections in
                self.homeSections = homeSections
            })
            .store(in: &cancellables)
    }
}
