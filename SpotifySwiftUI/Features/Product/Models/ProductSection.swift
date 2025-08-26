//
//  ProductSectionData.swift
//  SwiftUIClones
//
//  Created by ladans on 14/08/25.
//

import Foundation

struct ProductSection {
    let id: Int
    let title: String
    let products: [Product]
    
    static func getData(_ products: [Product]) -> Array<ProductSection> {
        [
            ProductSection(id: 1, title: "Plutónio", products: products),
            ProductSection(id: 2, title: "Chelsea Dinorath", products: products),
            ProductSection(id: 3, title: "Clean Boys", products: products),
            ProductSection(id: 4, title: "Andrew Belle", products: products),
            ProductSection(id: 5, title: "Twenty Fingers", products: products),
        ]
    }
}
