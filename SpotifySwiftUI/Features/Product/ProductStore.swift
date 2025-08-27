//
//  ProductStore.swift
//  SwiftUIClones
//
//  Created by ladans on 15/08/25.
//

import Foundation
import Combine

class ProductStore: ObservableObject {
    @Published var products: [Product] = []
    
    init()  {
        Task {
            await getProducts()
        }
    }
    
    private func getProducts() async {
        let (error, result) = await Service().getProdcuts()
        if let productsArray = result {
            products = Array(productsArray.products.prefix(8))
            print("Products gotten... \(productsArray)")
        } else if let error = error {
            print("Failed to fetch products: \(error.message)")
        }
    }
}
