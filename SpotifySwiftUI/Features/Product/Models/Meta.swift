//
//  Meta.swift
//  SpotifySwiftUI
//
//  Created by ladans on 26/08/25.
//

struct Meta: Codable, Hashable {
    let createdAt, updatedAt: CreatedAt
    let barcode: String
    let qrCode: String
}
