//
//  PodcastSections.swift
//  PodCastTask
//
//  Created by Ahmad on 22/11/2024.
//

import SwiftUI

struct PodcastSectionsViews: View {
    @ObservedObject var viewModel: PodcastSectionsViewModel

    var body: some View {
            List {
                ForEach(viewModel.homeSections, id: \.id) { section in
                    PodcastSectionFactory(section: section)
                        .cornerRadius(8)
                        .listRowInsets(EdgeInsets())
                        .padding()
                }
                .listRowBackground(Color.primaryBackground)
                .background(Color.primaryBackground.ignoresSafeArea())
            }
            .listStyle(.plain)
    }
}

