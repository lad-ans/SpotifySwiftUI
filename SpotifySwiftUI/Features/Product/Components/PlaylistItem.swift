//
//  SpotifyPlaylistItem.swift
//  SwiftUIClones
//
//  Created by ladans on 15/08/25.
//

import SwiftUI

struct PlaylistItem: View {
    let product: Product
    
    var body: some View {
        HStack {
            HStack(spacing: 16) {
                NetworkImage(
                    imageUrl: product.firstImage,
                    cornerRadius: 8,
                )
                .background(.spotifyDarkGrey)
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .frame(width: 68, height: 68)
                
                VStack(alignment: .leading, spacing: 4) {
                    Text(product.title)
                        .foregroundStyle(.spotifyWhite)
                        .font(.system(size: 18))
                    
                    Text(product.category.rawValue)
                        .foregroundStyle(.spotifyLightGrey)
                        .font(.system(size: 14))
                }
            }
            
            Spacer()
            
            Button {
                
            } label: {
                Image(systemName: "ellipsis")
                    .font(.system(size: 18, weight: .light))
                    .foregroundStyle(.spotifyWhite)
            }
        }
    }
}

#Preview {
    PlaylistItem(product: Product.mock)
}
