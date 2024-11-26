//
//  SearchViewModel.swift
//  PodCastTask
//
//  Created by Ahmad on 24/11/2024.
//


import Foundation
import Combine
import APINetworking

 final class SearchViewModel: ObservableObject {
    @Published var query: String = ""
    @Published var results: [SearchResultSection] = []
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?
    
    private let useCase: SearchUseCaseProtocol
    private var cancellables = Set<AnyCancellable>()
    private var debounceTimer: AnyCancellable?
    
    
    
    init(useCase: SearchUseCaseProtocol) {
        self.useCase = useCase
        setupSearchListener()
        
    }
    
    private func setupSearchListener() {
        
        $query
            .removeDuplicates()
            .debounce(for: .milliseconds(200), scheduler: RunLoop.main)
            .sink { [weak self] query in
                self?.performSearch(for: query)
            }
            .store(in: &cancellables)
    }
        
    
     func performSearch(for query: String) {
        guard !query.isEmpty else {
            results = []
            return
        }
        isLoading = true
        errorMessage = nil
        Task {
            do {
                let searchResults = try await useCase.search(query: query)
                DispatchQueue.main.async {
                    self.results = searchResults
                }
            } catch let error as NetworkRequestError {
                self.errorMessage = "Error: \(error.localizedDescription)"
            } catch {
                self.errorMessage = "An unknown error occurred."
            }
            DispatchQueue.main.async {
                self.isLoading = false
            }
        }
    }
}

