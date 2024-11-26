//
//  ProfileTabView.swift
//  PodCastTask
//
//  Created by Ahmad on 26/11/2024.
//

import SwiftUI

// MARK: - ProfileTabView
struct ProfileTabView: View {
    var body: some View {
        Text("Profile")
            .tabItem {
                Label("Profile", systemImage: "person.crop.circle")
            }
    }
}
