//
//  BaseView.swift
//  SpotifyClone
//
//  Created by ladans on 24/08/25.
//

import SwiftUI

struct BaseView: View {
    @State var selected: SpotifyTabItem = .home
    @State var showMenu: Bool = false
    @State var offset: CGFloat = 0
    @State var oldOffset: CGFloat = 0
    @GestureState var gestureOffset: CGFloat = 0
    
    /// Splash animation states
    @State var endAnimation = false
    @Namespace var animation
    @EnvironmentObject private var productStore: ProductStore
    
    var body: some View {
        GeometryReader { geometry in
            SplashView(
                logoSize: CGSize(width: 128, height: 128),
                endAnimation: $endAnimation,
                animation: animation,
            ) {
                HStack(spacing: .zero) {
                    SideMenu(showMenu: $showMenu, geometry: geometry)
                    
                    SpotifyTabView(
                        tabItems: SpotifyTabItem.allCases,
                        selected: $selected,
                    ) {
                        NavigationStack {
                            HomeView(
                                endAnimation: $endAnimation,
                                animation: animation,
                            ) {
                                Logo() {
                                    withAnimation {
                                        showMenu.toggle()
                                    }
                                }
                            }
                            .opacity(selected == .home ? 1 : 0)
                        }
                        
                        SearchView()
                            .opacity(selected == .search ? 1 : 0)
                        
                        LibraryView()
                            .opacity(selected == .library ? 1 : 0)
                        
                        PremiumView()
                            .opacity(selected == .premium ? 1 : 0)
                        
                        CreateView()
                            .opacity(selected == .create ? 1 : 0)
                        
                        /// Workaround on leading menu drag start
                        Rectangle()
                            .fill(Color.black.opacity(0.001))
                            .frame(width: 16)
                    }
                    .sideMenuContentOverlay(
                        showMenu: $showMenu,
                        onReset: resetSideMenuState,
                    )
                }
                .padding(.bottom, geometry.safeAreaInsets.bottom)
                .sideMenuPreferences(
                    oldOffset: $oldOffset,
                    offset: $offset,
                    showMenu: showMenu,
                    onEnd: onEnd,
                    onChange: onChange,
                    gestureOffset: $gestureOffset,
                )
            } title: {
                Text("Spotify")
                    .font(.system(size: 36).bold())
                    .foregroundStyle(.spotifyWhite)
            } logo: {
                Logo(onPressed: {})
            }
        }
    }
}

#Preview {
    BaseView()
        .environmentObject(ProductStore())
        .environmentObject(UserStore())
}
