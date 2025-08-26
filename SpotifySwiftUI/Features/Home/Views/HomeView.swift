//
//  SpotifyHomeView.swift
//  SwiftUIClones
//
//  Created by ladans on 02/07/25.
//

import SwiftUI

struct HomeView<LogoView: View>: View {
    @State private var selectedCategory: CategoryItem? = nil;
    @Binding var endAnimation: Bool
    var animation: Namespace.ID
    let logo: () -> LogoView
    
    @EnvironmentObject var productStore: ProductStore
    
    var body: some View {
        ZStack {
            Color.spotifyBlack.ignoresSafeArea()
            
            ScrollView(.vertical) {
                LazyVStack(spacing: 10, pinnedViews: [.sectionHeaders]) {
                    let data = ProductSection.getData(productStore.products)
                    
                    Section {
                        RecentSectionView(products: productStore.products)
                        
                        Spacer()
                            .frame(height: 10)
                        
                        YourChoicesSection(products: productStore.products)
                        
                        Spacer()
                            .frame(height: 10)
                        
                        ForEach(data, id: \.id) { item in
                            ProductSectionView(
                                section: item.title,
                                products: item.products,
                            )
                            
                            if item.id != data.last?.id {
                                Spacer()
                                    .frame(height: 10)
                            }
                            
                            if (item.id == data.last?.id) {
                                Spacer()
                                    .frame(height: 70)
                            }
                        }
                    } header: {
                        HeaderMenu(
                            selectedCategory: selectedCategory,
                            animation: animation,
                            endAnimation: $endAnimation,
                        ) { value in
                            selectedCategory = value
                        } logo: {
                            logo()
                        }
                    }
                }
            }
            .scrollIndicators(.hidden)
            .padding(.top, 8)
        }
    }
}

#Preview {
    @Previewable @State var endAnimation: Bool = false
    @Previewable @Namespace var animation
    
    HomeView(
        endAnimation: $endAnimation,
        animation: animation,
    ) {
        Logo(onPressed: {})
    }
    .environmentObject(ProductStore())
}
