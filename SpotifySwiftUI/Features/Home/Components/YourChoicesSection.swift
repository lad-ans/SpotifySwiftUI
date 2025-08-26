//
//  MiddleFeatureSection.swift
//  SwiftUIClones
//
//  Created by ladans on 13/08/25.
//

import SwiftUI

struct YourChoicesSection: View {
    let products: [Product]
    
    var body: some View {
        let product = products.last

        VStack(spacing: 10) {
            HStack {
                NetworkImage(imageUrl: Constants.randomImage)
                    .frame(width: 55, height: 55)
                    .clipShape(RoundedRectangle(cornerRadius: 55))
                
                VStack(alignment: .leading, spacing: 4) {
                    Text(product?.brand ?? "Brand")
                        .font(.system(size: 17))
                        .fontWeight(.light)
                        .foregroundStyle(.gray)
                    
                    Text(product?.category.rawValue ?? "category")
                        .font(.system(size: 18))
                        .fontWeight(.bold)
                        .foregroundStyle(Color.white.opacity(0.7))
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            if let product {
                NavigationLink(
                    destination: DetailView(product: product)
                ) {
                    ChoiceCard(product: product)
                }
                .buttonStyle(.plain)
            }
        }
        .padding(.horizontal, 16)
    }
}

#Preview {
    YourChoicesSection(
        products: (0..<4).map { _ in
            Product.mock
        }
    )
}
