//
//  Bank.swift
//  SpotifySwiftUI
//
//  Created by ladans on 26/08/25.
//

struct Bank: Codable {
    let cardExpire, cardNumber, cardType, currency: String
    let iban: String
}
