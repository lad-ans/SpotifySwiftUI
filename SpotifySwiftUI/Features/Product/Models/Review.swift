//
//  Review.swift
//  SpotifySwiftUI
//
//  Created by ladans on 26/08/25.
//

struct Review: Codable, Hashable {
    let rating: Int
    let comment: String
    let date: CreatedAt
    let reviewerName, reviewerEmail: String
}
