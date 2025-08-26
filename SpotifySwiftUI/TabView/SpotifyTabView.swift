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
        ZStack(alignment: .bottom) {
            ZStack { ZStack(alignment: .leading, content: content) }
            .frame(width: getRect().width)
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

#Preview {
    @Previewable @State var selected = SpotifyTabItem.home
    
    SpotifyTabView(
        tabItems: SpotifyTabItem.allCases,
        selected: $selected,
    ) {
        Text("Screen")
            .foregroundStyle(.white)
    }
    .environmentObject(ProductStore())
}

