//
//  ContentView.swift
//  PodCastTask
//
//  Created by Ahmad on 20/11/2024.
//

import SwiftUI

// MARK: - HomeMainView
struct HomeMainView: View {
    @StateObject private var viewModel = HomeMainViewModel(getHomeSectionsUseCase: GetHomeSectionsUseCaseImpl())
    
    var body: some View {
        TabView {
            
            HomeTabView(viewModel: viewModel)
            
            SearchView(viewModel: SearchViewModel(useCase: SearchUseCase(repository: SearchRepository())))
                .tabItem {
                    Label("Search", systemImage: "magnifyingglass")
                }
            
            ProfileTabView()
                .tabItem {
                    Label("Profile", systemImage: "person.crop.circle")
                }
        }
        .background(.primaryBackground)
        .onAppear {
            viewModel.getHomeSections()
        }
    }
}




