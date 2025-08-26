//
//  Address.swift
//  SpotifySwiftUI
//
//  Created by ladans on 26/08/25.
//

struct Address: Codable {
    let address, city, state, stateCode: String
    let postalCode: String
    let coordinates: Coordinates
    let country: Country
}
