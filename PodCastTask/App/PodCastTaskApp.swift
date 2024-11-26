//
//  PodCastTaskApp.swift
//  PodCastTask
//
//  Created by Ahmad on 20/11/2024.
//

import SwiftUI

@main
struct PodCastTaskApp: App {

    var body: some Scene {
        WindowGroup {
            HomeMainView()
                .background(Color.primaryBackground)
                .edgesIgnoringSafeArea(.all)
                .preferredColorScheme(.dark)  

        }
    }
}
