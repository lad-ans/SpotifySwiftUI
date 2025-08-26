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
                    SpotifyTabItem.library.title,
                    systemImage: SpotifyTabItem.library.icon,
                    value: .library
                ) {
                    LibraryView()
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
        @ViewBuilder logo: @escaping () -> LogoView
    ) {
        self._selected = State(initialValue: selected)
        self._endAnimation = endAnimation
        self.animation = animation
        self.logo = logo
    }
}

#Preview {
    NativeTabView(
        selected: .home,
        endAnimation: .constant(false),
        animation: Namespace().wrappedValue
    ) {
        Logo(onPressed: {})
    }
    .environmentObject(ProductStore())
}
