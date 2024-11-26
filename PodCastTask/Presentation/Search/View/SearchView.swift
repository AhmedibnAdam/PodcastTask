//
//  SearchView.swift
//  PodCastTask
//
//  Created by Ahmad on 24/11/2024.
//

import SwiftUI
import APINetworking

struct SearchView: View {
    @StateObject private var viewModel: SearchViewModel

    init(viewModel: SearchViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        NavigationView {
            VStack {
                searchTextField
                
                if viewModel.isLoading {
                    loadingIndicator
                } else if let errorMessage = viewModel.errorMessage {
                    errorView(message: errorMessage)
                } else {
                    resultsList
                }
                Spacer()
            }
            .navigationTitle("Search")
            .background(Color.primaryBackground)
        }
    }

    private var searchTextField: some View {
        TextField("Search...", text: $viewModel.query)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .padding()
            .disableAutocorrection(true)
    }

    private var loadingIndicator: some View {
        ProgressView()
            .padding()
    }

    private func errorView(message: String) -> some View {
        Text(message)
            .foregroundColor(.primaryText)
            .padding()
    }

    private var resultsList: some View {
        List(viewModel.results, id: \.id) { section in
            PodcastSectionFactory(section: section.toPodCastSection())
                .cornerRadius(8)
                .listRowInsets(EdgeInsets())
                .padding()
        }
        .animation(.easeInOut, value: viewModel.results)
    }
}
