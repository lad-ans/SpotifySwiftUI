//
//  Logo.swift
//  SpotifySwiftUI
//
//  Created by ladans on 25/08/25.
//

import SwiftUI

struct Logo: View {
    let onPressed: () -> Void
    
    var body: some View {
        Button {
            onPressed()
        } label: {
            Circle()
                .fill(.spotifyGrey)
                .overlay(
                    Image("Logo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                )
        }
    }
}

#Preview {
    Logo() {}
}
