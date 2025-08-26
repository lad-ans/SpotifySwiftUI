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
            Image("Logo")
                .resizable()
                .scaledToFill()
                .clipShape(Circle())
        }
    }
}

#Preview {
    ZStack {
        Color.spotifyBlack.ignoresSafeArea()
        
        Logo() {}
            .frame(width: 128, height: 128)
    }
}
