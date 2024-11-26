//
//  NotificationButton.swift
//  PodCastTask
//
//  Created by Ahmad on 22/11/2024.
//

import SwiftUI

struct NotificationButton: View {
    var body: some View {
        Button(action: {
            print("Notification tapped!")
        }) {
            Image(systemName: "bell")
                .foregroundColor(.primaryText)
        }
        .accessibilityIdentifier("NotificationButton")
    }
}


#Preview {
    NotificationButton()
}
