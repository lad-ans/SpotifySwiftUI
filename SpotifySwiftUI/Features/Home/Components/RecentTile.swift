//
//  SpotifyRecentTile.swift
//  SwiftUIClones
//
//  Created by ladans on 12/08/25.
//

import SwiftUI

struct RecentTile: View {
    let product: Product?
    
    var body: some View {
        HStack(spacing: 8) {
            NetworkImage(imageUrl: product?.firstImage ?? Constants.randomImage)
                .frame(width: 55, height: 55)
                .background(.spotifyGrey)
                .clipShape(RoundedRectangle(cornerRadius: 4))
            
            Text(product?.title ?? "Sample title for the tile and more")
                .font(.system(size: 14, weight: .semibold))
                .lineLimit(2)
                .padding(.trailing, 8)
                .frame(maxWidth: .infinity, alignment: .leading)
            
        }
        .tileStyle(isSelected: false)
        .clipShape(RoundedRectangle(cornerRadius: 4))
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

#Preview {
    VStack {
        RecentTile(product: nil)
        RecentTile(product: nil)
    }
}
