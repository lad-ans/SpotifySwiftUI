//
//  CustomTab.swift
//  SwiftUIClones
//
//  Created by ladans on 16/08/25.
//

import Foundation

enum SpotifyTabItem: String, CaseIterable {
    case home
    case search
    case library
    case premium
    case create

    var icon: String {
        switch self {
        case .home: return "house.fill"
        case .search: return "magnifyingglass"
        case .library: return "music.note.list"
        case .premium: return "headphones.dots"
        case .create: return "plus"
        }
    }

    var title: String {
        switch self {
        case .home: return "Home"
        case .search: return "Search"
        case .library: return "Library"
        case .premium: return "Premium"
        case .create: return "Create"
        }
    }
}
