//
//  SpotifyProductThumbnail.swift
//  SwiftUIClones
//
//  Created by ladans on 15/08/25.
//

import SwiftUI

struct ProductThumbnail: View {
    var showBadge: Bool = false
    let product: Product
    var largeSize: Bool = false
    var color: Color?
    
    var body: some View {
        let backgroundColor = color ?? .yellow

        ZStack(alignment: .topLeading) {
            NetworkImage(imageUrl: product.firstImage)
                .background(.spotifyDarkGrey)

            if showBadge {
                Text("Mix do dia 3")
                    .font(.system(size: largeSize ? 25 : 14, weight: .semibold))
                    .foregroundStyle(backgroundColor.idealForegroundColor)
                    .padding(.vertical, largeSize ? 4 : 0)
                    .padding(.horizontal, largeSize ? 8 : 4)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(backgroundColor)
                    .frame(maxHeight: .infinity, alignment: .bottomLeading)
                    .padding(.bottom, largeSize ? 10 : 4)
                    .padding(.horizontal, largeSize ? 8 : 4)
                
                Image(systemName: "headphones.circle")
                    .foregroundStyle(backgroundColor.idealForegroundColor)
                    .font(.system(size: largeSize ? 18 : 12))
                    .padding(4)
                    .background(color ?? .yellow)
                    .clipShape(RoundedRectangle(cornerRadius: 22))
                    .padding(.top, largeSize ? 10 : 4)
                    .padding(.leading, largeSize ? 10 : 4)
            }
                
        }
    }
}

#Preview {
    ProductThumbnail(
        showBadge: true,
        product: Product.mock,
    )
}
