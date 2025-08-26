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
        do {
            products = try await Array(DatabaseHelper().getProdcuts().prefix(8))
        } catch {}
    }
}
