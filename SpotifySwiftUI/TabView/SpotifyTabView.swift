//
//  ViewWrapper.swift
//  SwiftUIClones
//
//  Created by ladans on 16/08/25.
//

import SwiftUI

struct SpotifyTabView<Content: View>: View {
    let tabItems: [SpotifyTabItem]
    @Binding var selected: SpotifyTabItem
    @Binding var showTabBar: Bool
    @ViewBuilder var content: () -> Content
    
    @Namespace var animation
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .bottom) {
                ZStack { ZStack(alignment: .leading, content: content) }
                    .frame(width: geometry.width)
                    .frame(maxHeight: .infinity)
                    .animation(nil, value: selected)
                    .ignoresSafeArea()
                
                if showTabBar || selected != .reels {
                    TabBar(
                        animation: animation,
                        selected: $selected,
                        tabItems: tabItems,
                    )
                }
            }
            .background(Color.spotifyBlack.ignoresSafeArea())
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                    showTabBar = false
                }
            }
        }
    }
}

#Preview {
    SpotifyTabView(
        tabItems: SpotifyTabItem.allCases,
        selected: .constant(.home),
        showTabBar: .constant(true)
    ) {
        Text("Screen")
            .foregroundStyle(.white)
    }
    .environmentObject(ProductStore())
}

