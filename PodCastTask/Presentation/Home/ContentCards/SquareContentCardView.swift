//
//  SquareContentCardView.swift
//  PodCastTask
//
//  Created by Ahmad on 22/11/2024.
//

import SwiftUI

struct SquareContentCardView: View {
    let item: PodCastSectionContent

    var body: some View {
        NavigationLink(destination: DetailViewControllerWrapper(item: item)) {
            VStack(alignment: .leading, spacing: 8) {
                
                if let url = URL(string: item.avatar_url ?? "") {
                    AsyncImage(url: url) { image in
                        image
                            .resizable()
                            .scaledToFill()
                            .frame(width: 150, height: 150)
                            .clipShape(RoundedRectangle(cornerRadius: 12))
                    } placeholder: {
                        Color.gray
                            .frame(width: 150, height: 150)
                            .clipShape(RoundedRectangle(cornerRadius: 12))
                    }
                }
                
                Text(item.name)
                    .font(.subheadline)
                    .foregroundColor(.primaryText)
                    .lineLimit(1)
                    .padding(.horizontal, 4)
                
                if let formattedDate = DateFormatter.formatDate(item.releaseDate) {
                    Text(formattedDate)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                        .padding(.horizontal, 4)
                }
                
                HStack(spacing: 6) {
                    if let episodesCount = item.episodeCount {
                        HStack(spacing: 4) {
                            Image(systemName: "list.bullet")
                                .foregroundColor(.orange)
                            Text("\(episodesCount)")
                                .font(.subheadline)
                                .foregroundColor(.orange)
                        }
                    }
                    
                    HStack(spacing: 4) {
                        Image(systemName: "clock")
                            .foregroundColor(.gray)
                        Text(DateFormatter.formatDuration(item.duration ?? 0))
                            .lineLimit(1)
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                }
                .padding(.horizontal, 4)
            }
            .frame(width: 150, height: 150) 
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .shadow(color: .primaryBackground.opacity(0.2), radius: 5, x: 0, y: 4)
            .padding(4)
        }
    }
}
