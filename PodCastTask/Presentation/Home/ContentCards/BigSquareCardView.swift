//
//  BigSquareCardView.swift
//  PodCastTask
//
//  Created by Ahmad on 24/11/2024.
//

import SwiftUI

struct BigSquareCardView: View {
    let item: PodCastSectionContent

    var body: some View {
        NavigationLink(destination: DetailViewControllerWrapper(item: item)) {
            ZStack {
                if let url = URL(string: item.avatar_url ?? "") {
                    AsyncImage(url: url) { image in
                        image
                            .resizable()
                            .scaledToFill()
                            .frame(width: 256, height: 256)
                            .clipped()
                            .overlay(
                                RoundedRectangle(cornerRadius: 12)
                                    .fill(Color.black.opacity(0.3))
                            )
                    } placeholder: {
                        Color.gray
                            .frame(width: 256, height: 256)
                            .clipShape(RoundedRectangle(cornerRadius: 12))
                    }
                } else {
                    Color.gray
                        .frame(width: 256, height: 160)
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                }
                
                // Overlay Content
                VStack(alignment: .leading, spacing: 6) {
                    Spacer()
                    
                    // Title
                    Text(item.name)
                        .font(.headline)
                        .foregroundColor(.primaryText)
                        .multilineTextAlignment(.leading)
                        .lineLimit(2)
                    
                    if let formattedDate = DateFormatter.formatDate(item.releaseDate) {
                        Text(formattedDate)
                            .font(.subheadline)
                            .foregroundColor(.primaryText.opacity(0.8))
                            .lineLimit(1)
                    }
                    
                    HStack {
                        if let episodesCount = item.episodeCount {
                            HStack(spacing: 4) {
                                Image(systemName: "list.bullet")
                                    .foregroundColor(.primaryText)
                                Text("\(episodesCount)")
                                    .font(.subheadline)
                                    .foregroundColor(.primaryText)
                            }
                        }
                        
                        HStack(spacing: 4) {
                            Image(systemName: "clock")
                                .foregroundColor(.primaryText)
                            Text(DateFormatter.formatDuration(item.duration ?? 0))
                                .lineLimit(1)
                                .font(.subheadline)
                                .foregroundColor(.primaryText.opacity(0.8))
                        }
                    }
                }
                .padding(.vertical, 8)
            }
            .frame(width: 256, height: 256)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .shadow(color: .black.opacity(0.2), radius: 5, x: 0, y: 4)
            .background(.secondaryBackground)
        }
    }
}
