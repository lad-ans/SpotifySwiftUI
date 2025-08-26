//
//  SpotifyCustomDetailView.swift
//  SwiftUIClones
//
//  Created by ladans on 17/08/25.
//

import SwiftUI

struct ResizableHeaderDetailView: View {
    let product: Product
    @EnvironmentObject var productStore: ProductStore
    @Environment(\.dismiss) private var dismiss
    
    let randomColor = Color.random
    
    var body: some View {
        ZStack(alignment: .top) {
            DynamicBackgroundGradient(randomColor)
            
            ResizableHeader(
                minimumHeight: 150,
                maximumHeight: 74.w,
                ignoreSafeAreaTop: false,
            ) { progress, safeArea in
                VStack(alignment: .leading, spacing: 15) {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "chevron.left")
                            .font(.title3)
                            .fontWeight(.medium)
                            .foregroundColor(.spotifyWhite)
                            .frame(width: 42, height: 42)
                            .background(.ultraThinMaterial, in: .rect(cornerRadius: 42))
                    }
                    
                    Rectangle()
                        .fill(.clear)
                        .overlay {
                            ProductThumbnail(
                                showBadge: true,
                                product: product,
                                largeSize: true,
                                color: randomColor,
                            )
                            .frame(width: 74.w,  alignment: .center)
                        }
                        .frame(width: .infinity)
                        .zIndex(1)
                }
                .padding(.horizontal, 20)
            } content: {
                VStack(alignment: .leading, spacing: 20) {
                    NowPlayingInfo(product: product)
                    
                    ForEach(productStore.products) { product in
                        PlaylistItem(product: product)
                    }
                }
                .padding(20)
            }
        }
    }
}

#Preview {
    ResizableHeaderDetailView(product: Product.mock)
        .environmentObject(ProductStore())
}
