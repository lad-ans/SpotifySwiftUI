//
//  ViewWrapper.swift
//  SwiftUIClones
//
//  Created by ladans on 16/08/25.
//

import SwiftUI

struct SpotifyTabView<Content: View>: View {
    let tabItems: [SpotifyTabItem]
    var selected: Binding<SpotifyTabItem>
    @ViewBuilder var content: () -> Content
    
    @Namespace var animation
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .bottom) {
                ZStack { ZStack(alignment: .leading, content: content) }
                    .frame(width: geometry.width)
                    .frame(maxHeight: .infinity)
                    .animation(nil, value: selected.wrappedValue)
                    .ignoresSafeArea()
                
                TabBar(
                    animation: animation,
                    selected: selected,
                    tabItems: tabItems,
                )
            }
            .background(Color.spotifyBlack.ignoresSafeArea())
        }
    }
}

#Preview {
    SpotifyTabView(
        tabItems: SpotifyTabItem.allCases,
        selected: .constant(.home),
    ) {
        Text("Screen")
            .foregroundStyle(.white)
    }
    .environmentObject(ProductStore())
}

