//
//  SpotifyPlayingHeader.swift
//  SwiftUIClones
//
//  Created by ladans on 15/08/25.
//

import SwiftUI

struct NowPlayingInfo: View {
    let product: Product
    var dynamicSpacing: CGFloat? = 10
    
    var body: some View {
        VStack(alignment: .leading, spacing: dynamicSpacing) {
            VStack(alignment: .leading, spacing: 10) {
                Text("MOBBERS, Plutónio, Clean Boyz and more")
                    .foregroundStyle(.spotifyLightGrey)
                    .font(.callout)
                
                HStack(spacing: 12) {
                    Image(systemName: "headphones.over.ear")
                        .foregroundStyle(.spotifyDarkGrey)
                        .font(.system(size: 16))
                        .padding(4)
                        .background(.spotifyGreen)
                        .clipShape(RoundedRectangle(cornerRadius: 100))
                    
                    Text(madeFor)
                }
                
                Text(aboutRecommendationsAndShareImpact)
                
                Text("2h 54m")
                    .font(.system(size: 17))
                    .foregroundStyle(.spotifyLightGrey)
            }
            
            NowPlayingControlBar(product: product)
        }
    }
}

#Preview {
    NowPlayingInfo(product: Product.mock)
}
