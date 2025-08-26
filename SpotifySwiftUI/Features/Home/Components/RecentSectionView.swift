//
//  SpotifyRecentSectionView.swift
//  SwiftUIClones
//
//  Created by ladans on 13/08/25.
//

import SwiftUI

struct RecentSectionView: View {
    let products: [Product]
    
    var body: some View {
        LazyVGrid(
            columns: [
                GridItem(.flexible(), alignment: .leading),
                GridItem(.flexible(), alignment: .leading),
            ],
            spacing: 10,
        ) {
            ForEach(products) { product in
                NavigationLink(
                    destination: DetailView(product: product)
                ) {
                    RecentTile(product: product)
                }
                .buttonStyle(.plain)
            }
        }
        .padding(.horizontal, 16)
    }
}

#Preview {
    RecentSectionView(
        products: (0..<8).map { _ in
            Product.mock
        }
    )
}
