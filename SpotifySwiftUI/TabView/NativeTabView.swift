//
//  ViewWrapper.swift
//  SwiftUIClones
//
//  Created by ladans on 16/08/25.
//

import SwiftUI

struct NativeTabView<LogoView: View>: View {
    @State var selected: SpotifyTabItem = .home
    @State var searchKey: String = ""
    @Binding var endAnimation: Bool
    var animation: Namespace.ID
    let geometry: GeometryProxy
    let logo: () -> LogoView
            
    var body: some View {
        NavigationStack {        
            TabView(selection: $selected) {
                Tab(
                    SpotifyTabItem.home.title,
                    systemImage: SpotifyTabItem.home.icon,
                    value: .home
                ) {
                    HomeView(
                        endAnimation: $endAnimation,
                        animation: animation,
                        logo: logo
                    )
                }
                
                Tab(
                    SpotifyTabItem.reels.title,
                    systemImage: SpotifyTabItem.reels.icon,
                    value: .reels
                ) {
                    ReelView(
                        geometry: geometry,
                        showTabBar: .constant(true),
                        selected: .constant(.home),
                    )
                }
                
                Tab(
                    SpotifyTabItem.premium.title,
                    systemImage: SpotifyTabItem.premium.icon,
                    value: .premium
                ) {
                    PremiumView()
                }
                
                Tab(
                    SpotifyTabItem.search.title,
                    systemImage: SpotifyTabItem.search.icon,
                    value: .search,
                    role: .search
                ) {
                    SearchView()
                        .navigationTitle("Search")
                        .searchable(text: $searchKey)
                        .toolbarColorScheme(.dark, for: .navigationBar)
                }
            }
            .accentColor(Color.spotifyGreen)
        }
    }
}

extension NativeTabView {
    init(
        selected: SpotifyTabItem = .home,
        endAnimation: Binding<Bool>,
        animation: Namespace.ID,
        geometry: GeometryProxy,
        @ViewBuilder logo: @escaping () -> LogoView,
    ) {
        self._selected = State(initialValue: selected)
        self._endAnimation = endAnimation
        self.animation = animation
        self.logo = logo
        self.geometry = geometry
    }
}

#Preview {
    GeometryReader { geometry in
        NativeTabView(
            selected: .home,
            endAnimation: .constant(false),
            animation: Namespace().wrappedValue,
            geometry: geometry,
        ) {
            Logo(onPressed: {})
        }
        .environmentObject(ProductStore())
    }
}
