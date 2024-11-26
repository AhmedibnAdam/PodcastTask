//
//  File.swift
//  PodCastTask
//
//  Created by Ahmad on 22/11/2024.
//

import SwiftUI

struct WelcomeMessage: View {
    var body: some View {
        HStack {
            Image(systemName: "person.crop.circle")
                .foregroundColor(.primaryText)
            Text("Welcome, Adam")
                .font(.headline)
                .foregroundColor(.primaryText)
            Spacer()
            Image(systemName: "gear")
                .foregroundColor(.primaryText)
                .padding(.leading, 8)
        }
        .padding()
    }
}
