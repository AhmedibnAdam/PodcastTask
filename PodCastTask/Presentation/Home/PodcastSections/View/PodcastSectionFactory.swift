//
//  PodcastSectionView.swift
//  PodCastTask
//
//  Created by Ahmad on 24/11/2024.
//

import SwiftUI

struct PodcastSectionFactory: View {
    let section: PodCastSection

    var body: some View {
        Section(header: headerView) {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 16) {
                    SectionViewFactory.makeView(for: section)
                }
                .background(.primaryBackground)
                .padding(.horizontal, 8)
            }
            .background(.primaryBackground)
            .accessibilityIdentifier("Section_Header")
        }
    }

    private var headerView: some View {
        HStack {
            Text(section.name)
                .font(.headline)
                .fontWeight(.bold)
                .foregroundColor(.primaryText)
                .accessibilityIdentifier("PodcastSectionHeader_\(section.name)")

            
            Spacer()
        }
        .padding(.vertical, 4)
    }
}


enum SectionViewFactory {
    static func makeView(for section: PodCastSection) -> some View {
        switch section.type {
        case SectionType.square.rawValue:
            return ForEach(section.content ?? [], id: \.id) {
                SquareContentCardView(item: $0)
            }
        case SectionType.bigSquare.rawValue, SectionType.bigSquareWithSpace.rawValue:
            return ForEach(section.content ?? [], id: \.id) {
                BigSquareCardView(item: $0)
            }
        case SectionType.queue.rawValue:
            return ForEach(section.content ?? [], id: \.id) {
                QueueGridCardView(item: $0)
            }
        default:
            let contentPairs = section.content?.chunked(into: 2) ?? []
            return ForEach(contentPairs, id: \.self) { pair in
                VStack(spacing: 16) {
                    ForEach(pair, id: \.id) { item in
                        LineGridCardView(item: item)
                    }
                }
            }
        }
    }
}
