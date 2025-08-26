//
//  TabItem.swift
//  SwiftUIClones
//
//  Created by ladans on 16/08/25.
//

import SwiftUI

struct TabItem: View {
    var icon: String
    var tab: SpotifyTabItem
    var animation: Namespace.ID
    
    @Binding var selected: SpotifyTabItem
    @Environment(\.log) private var log

    var body: some View {
        VStack {
            Button {
                withAnimation { selected = tab }
                log("Selected: \(tab.title)")
            } label: {
                VStack {
                    ZStack {
                        TabIndicator()
                            .fill(.clear)
                            .frame(width: 45, height: 6)
                        
                        if selected == tab {
                            TabIndicator()
                                .fill(.spotifyGreen)
                                .frame(width: 45, height: 6)
                                .matchedGeometryEffect(id: "Tab_Change", in: animation)
                        }
                    }
                    .padding(.bottom, 6)
                    
                    Image(systemName: icon)
                        .renderingMode(.template)
                        .resizable()
                        .foregroundStyle(selected == tab ? .spotifyGreen : .spotifyLightGrey)
                        .frame(width: 20, height: 20)
                    
                    Text(tab.title)
                        .font(.caption)
                        .foregroundStyle(selected == tab ? .spotifyWhite : .spotifyLightGrey)
                }
            }
        }
    }
}
