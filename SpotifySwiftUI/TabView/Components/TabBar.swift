//
//  TabBar.swift
//  SpotifyClone
//
//  Created by ladans on 24/08/25.
//

import SwiftUI

struct TabBar: View {
    let animation: Namespace.ID
    var selected: Binding<SpotifyTabItem>
    let tabItems: [SpotifyTabItem]
    
    var body: some View {
        Spacer()
            .frame(height: 70)
            .blur(radius: 4.6)
            .background(LinearGradient(
                gradient: Gradient(
                    stops: [
                        .init(color: .spotifyBlack.opacity(0.0), location: 0),
                        .init(color: .spotifyBlack.opacity(0.4), location: 0.4),
                        .init(color: .spotifyBlack.opacity(0.6), location: 0.6),
                        .init(color: .spotifyBlack.opacity(0.7), location: 0.7),
                        .init(color: .spotifyBlack.opacity(0.8), location: 0.8),
                        .init(color: .spotifyBlack.opacity(1.0), location: 1.0),
                    ],
                ),
                startPoint: .top,
                endPoint: .bottom
            ))
            .overlay {
                HStack {
                    ForEach(tabItems, id: \.self) { tab in
                        TabItem(
                            icon: tab.icon,
                            tab: tab,
                            animation: animation,
                            selected: selected
                        )
                        
                        if tab != SpotifyTabItem.allCases.last! {
                            Spacer()
                        }
                    }
                }
                .padding(.horizontal, 20)
                .frame(maxWidth: getRect().width)
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            .ignoresSafeArea(.container, edges: .bottom)
    }
}

#Preview {
    @Previewable @State var selected: SpotifyTabItem = .home
    @Previewable @Namespace var animation
    TabBar(animation: animation, selected: $selected, tabItems: SpotifyTabItem.allCases)
}
