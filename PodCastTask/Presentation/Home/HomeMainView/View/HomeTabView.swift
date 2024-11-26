//
//  HomeTabView.swift
//  PodCastTask
//
//  Created by Ahmad on 26/11/2024.
//

import SwiftUI


// MARK: - HomeTabView
struct HomeTabView: View {
    @ObservedObject var  viewModel: HomeMainViewModel
    
    var body: some View {
        NavigationView {
            if viewModel.isLoading {
                            ProgressView("Loading...")
                                .progressViewStyle(CircularProgressViewStyle())
            } else {
                PodcastSectionsViews(viewModel: PodcastSectionsViewModel(homeSections: viewModel.homeSections))
                    .navigationBarItems(
                        leading: WelcomeMessage(),
                        trailing: NotificationButton()
                    )
                    .background(.primaryBackground)
                    .navigationBarTitle("", displayMode: .inline)
            }
        }
        .tabItem {
            Label("Home", systemImage: "house")
        }
    }
}
