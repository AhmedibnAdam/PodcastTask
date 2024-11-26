//
//  QueueGridCardView.swift
//  PodCastTask
//
//  Created by Ahmad on 25/11/2024.
//

import SwiftUI

struct QueueGridCardView: View {
    let item: PodCastSectionContent
    
    var body: some View {
    
        NavigationLink(destination: DetailViewControllerWrapper(item: item)) {
            HStack(spacing: 8) {
                if let url = URL(string: item.avatar_url ?? "") {
                    AsyncImage(url: url) { image in
                        image
                            .resizable()
                            .scaledToFill()
                            .frame(width: 128, height: 128)
                            .clipShape(RoundedRectangle(cornerRadius: 12))
                    } placeholder: {
                        Color.gray
                            .frame(width: 128, height: 128)
                            .clipShape(RoundedRectangle(cornerRadius: 12))
                    }
                } else {
                    Color.gray
                        .frame(width: 128, height: 128)
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                }
                
                VStack(alignment: .leading, spacing: 6) {
                    Text(item.name)
                        .font(.headline)
                        .foregroundColor(.secondary)
                        .lineLimit(2)
                        .multilineTextAlignment(.leading)
                        .accessibilityIdentifier("PodcastItem_\(item.name)")
                    
                    Text(DateFormatter.formatDuration(item.duration ?? 0))
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    
                    Spacer()
                    
                    VStack {
                        Spacer()
                        HStack {
                            Spacer()
                            ZStack {
                                Circle()
                                    .fill(Color.secondaryText)
                                    .frame(width: 32, height: 32)
                                    .shadow(color: .primaryText.opacity(0.1), radius: 4, x: 0, y: 2)
                                
                                Image(systemName: "play.fill")
                                    .foregroundColor(.black)
                                    .font(.system(size: 20))
                            }
                            .padding(4)
                        }
                    }
                }
                .padding(.vertical, 8)
            }
            .padding()
            .frame(maxWidth: 350, alignment: .leading)
            .background(.secondaryBackground)
            .clipShape(RoundedRectangle(cornerRadius: 16))
            .shadow(color: .secondaryBackground.opacity(0.1), radius: 4, x: 0, y: 2)
        }
    }
}
