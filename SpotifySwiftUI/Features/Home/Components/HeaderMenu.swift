//
//  SpotifyHeader.swift
//  SwiftUIClones
//
//  Created by ladans on 13/08/25.
//

import SwiftUI

struct HeaderMenu<LogoView: View>: View {
    let selectedCategory: CategoryItem?
    let animation: Namespace.ID
    let endAnimation: Binding<Bool>
    let onCategoryChange: (CategoryItem?) -> Void
    let logo: () -> LogoView
    
    @State var showLogo: Bool = false
    
    var body: some View {
        HStack {
            ZStack {
                if endAnimation.wrappedValue {
                    logo()
                }
            }
            .onChange(of: endAnimation.wrappedValue) {
                withAnimation {
                    if endAnimation.wrappedValue {
                        showLogo = true
                    }
                }
            }
            .matchedGeometryEffect(id: "LOGO", in: animation)
            .frame(width: 35, height: 35)
            .padding(.leading, 16)
            
            ScrollView(.horizontal) {
                HStack(spacing: 8) {
                    ForEach(CategoryItem.allCases, id: \.self) { category in
                        CategoryTile(
                            title: category.rawValue.capitalized,
                            isSelected: category == selectedCategory,
                        )
                        .onTapGesture {
                            withAnimation {
                                onCategoryChange(category)
                            }
                        }
                    }
                }
            }
            .scrollIndicators(.hidden)
        }
        .padding(.vertical, 8)
        .background(Color.spotifyBlack)
    }
}

#Preview {
    @Previewable @State var endAnimation = false
    @Previewable @State var hideLogo = true
    @Previewable @Namespace var animation
    
    HeaderMenu(
        selectedCategory: nil,
        animation: animation,
        endAnimation: $endAnimation,
        onCategoryChange: { _ in },
        logo: { Logo() {} },
    )
}
