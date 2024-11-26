//
//  LineGridCardView.swift
//  PodCastTask
//
//  Created by Ahmad on 24/11/2024.
//

import SwiftUI

struct LineGridCardView: View {
    let item: PodCastSectionContent

    var body: some View {
        NavigationLink(destination: DetailViewControllerWrapper(item: item)) {
            HStack(spacing: 8) {
                if let url = URL(string: item.avatar_url ?? "") {
                    AsyncImage(url: url) { image in
                        image
                            .resizable()
                            .scaledToFill()
                            .frame(width: 86, height: 86) 
                            .clipShape(RoundedRectangle(cornerRadius: 12))
                            .padding()
                    } placeholder: {
                        Color.gray
                            .frame(width: 86, height: 86)
                            .clipShape(RoundedRectangle(cornerRadius: 12))
                    }
                } else {
                    Color.gray
                        .frame(width: 86, height: 86)
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                }
                
                VStack(alignment: .leading, spacing: 4) {
                    
                    Text(item.name)
                        .font(.subheadline)
                        .foregroundColor(.primaryText)
                        .lineLimit(2)
                        .multilineTextAlignment(.leading)
//                        .fixedSize(horizontal: true, vertical: true)
                    
                    
                    HStack(spacing: 4) {
                        Image(systemName: "clock")
                            .foregroundColor(.gray)
                        Text(DateFormatter.formatDuration(item.duration ?? 0))
                            .lineLimit(1)
                            .font(.subheadline)
                            .foregroundColor(.gray)
                        
                        Spacer()
                        
                        Image(systemName: "list.bullet")
                            .foregroundColor(.primaryText)
                    }
                }
                .padding(4)
            }
            .frame(maxWidth: 320, alignment: .leading)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .shadow(color: .primaryBackground.opacity(0.1), radius: 4, x: 0, y: 2)
            .background(.secondaryBackground)
        }
    }
}


