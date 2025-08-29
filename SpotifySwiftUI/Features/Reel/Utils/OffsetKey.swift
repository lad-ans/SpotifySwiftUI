//
//  OffsetKey.swift
//  SpotifySwiftUI
//
//  Created by ladans on 28/08/25.
//

import SwiftUI

struct OffsetKey: PreferenceKey {
    static var defaultValue: CGRect = .zero
    
    static func reduce(value: inout CGRect, nextValue: () -> CGRect) {
        value = nextValue()
    }
}

struct TabKey: PreferenceKey {
    static var defaultValue: SpotifyTabItem = .home
    
    static func reduce(value: inout SpotifyTabItem, nextValue: () -> SpotifyTabItem) {
        value = nextValue()
    }
}
