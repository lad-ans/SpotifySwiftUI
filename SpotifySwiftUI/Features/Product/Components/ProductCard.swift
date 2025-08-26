//
//  ProductCard.swift
//  SwiftUIClones
//
//  Created by ladans on 14/08/25.
//

import SwiftUI

struct ProductCard: View {
    let product: Product
    var showBadge: Bool = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
                ProductThumbnail(
                    showBadge: showBadge,
                    product: product,
                )
                
                Text(product.description)
                    .font(.system(size: 13))
                    .foregroundStyle(.gray)
                    .lineLimit(2)
            }
            .frame(width: 140, height: 180)
    }
}

#Preview {
    ZStack {
        Color.spotifyDarkGrey
            .ignoresSafeArea()
    
        ProductCard(
            product: Product.mock,
            showBadge: true,
        )
    }
}
