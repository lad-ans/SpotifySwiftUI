//
//  SpotifyNowPlayingHeader.swift
//  SwiftUIClones
//
//  Created by ladans on 15/08/25.
//

import SwiftUI

struct NowPlayingHeader: View {
    let product: Product
    
    var body: some View {
        VStack(spacing: 30) {
            ProductThumbnail(
                showBadge: true,
                product: product,
                largeSize: true,
            )
            .background(.spotifyDarkGrey)
            .frame(width: 74.w, height: 74.w)
            .clipped()
            
            NowPlayingInfo(product: product)
        }
    }
}

#Preview {
    NowPlayingHeader(product: Product.mock)
}
