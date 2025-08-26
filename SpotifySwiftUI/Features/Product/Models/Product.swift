//
//  Product.swift
//  SwiftUIPractice
//
//  Created by Developer on 02/07/25.
//

import Foundation

struct ProductArray: Codable {
    let products: [Product]
    let total, skip, limit: Int
}

struct Product: Codable, Identifiable, Hashable {
    let id: Int
    let title, description: String
    let category: Category
    let price, discountPercentage, rating: Double
    let stock: Int
    let tags: [String]
    let brand: String?
    let sku: String
    let weight: Int
    let dimensions: Dimensions
    let warrantyInformation, shippingInformation: String
    let availabilityStatus: AvailabilityStatus
    let reviews: [Review]
    let returnPolicy: ReturnPolicy
    let minimumOrderQuantity: Int
    let meta: Meta
    let images: [String]
    let thumbnail: String
    
    var firstImage: String {
        images.first ?? Constants.randomImage
    }
    
    static var mock: Product {
        Product(
            id: 3,
            title: "Ladans good scene",
            description: "Cool and half man half robot",
            category: Category.beauty,
            price: 234443.98,
            discountPercentage: 23.39,
            rating: 4,
            stock: 3,
            tags: ["nice"],
            brand: "iPhone",
            sku: "1234",
            weight: 23,
            dimensions: Dimensions(width: 12, height: 23, depth: 4),
            warrantyInformation: "good",
            shippingInformation: "Road number 2",
            availabilityStatus: .inStock,
            reviews: [
                Review(
                    rating: 23, comment: "nice",
                    date: CreatedAt.the20250430T094102053Z,
                    reviewerName: "Ladans",
                    reviewerEmail: "ladans.me@gmail.com",
                ),
            ],
            returnPolicy: .noReturnPolicy,
            minimumOrderQuantity: 2,
            meta: Meta(
                createdAt: CreatedAt.the20250430T094102053Z,
                updatedAt: CreatedAt.the20250430T094102053Z,
                barcode: "2355443434",
                qrCode: "dsdsd",
            ),
            images: [],
            thumbnail: "nothumbnail",
        )
    }
}
