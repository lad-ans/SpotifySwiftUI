//
//  View+SideMenu+Extensions.swift
//  SpotifySwiftUI
//
//  Created by ladans on 26/08/25.
//

import SwiftUI

extension View {
    var sideBarWidth: CGFloat {
        getRect().width - 90
    }
}
