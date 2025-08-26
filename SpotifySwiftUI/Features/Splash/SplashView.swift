//
//  SplashScreen.swift
//  SpotifyClone
//
//  Created by ladans on 25/08/25.
//

import SwiftUI

struct SplashView<Content: View, Title: View, Logo: View>: View {
    let content: Content
    let title: Title
    let logo: Logo
    var logoSize: CGSize
    var endAnimation: Binding<Bool>
    let animation: Namespace.ID
    
    @State var titleAnimation = false
    @State var backgroundAnimation = false
    
    init(
        logoSize: CGSize,
        endAnimation: Binding<Bool>,
        animation: Namespace.ID,
        @ViewBuilder content: @escaping () -> Content,
        @ViewBuilder title: @escaping () -> Title,
        @ViewBuilder logo: @escaping () -> Logo,
    ) {
        self.content = content()
        self.title = title()
        self.logo = logo()
        self.logoSize = logoSize
        self.endAnimation = endAnimation
        self.animation = animation
    }
    
    var body: some View {
        ZStack(alignment: .center) {
            content
            
            ZStack {
                if !backgroundAnimation {
                    Color.spotifyBlack
                        .overlay {
                            if !titleAnimation {
                                titleView
                            }
                            
                            if !endAnimation.wrappedValue {
                                logoView
                            }
                        }
                }
            }
        }
        .onAppear(perform: onAppear)
    }
    
    var logoView: some View {
        logo
            .matchedGeometryEffect(id: "LOGO", in: animation)
            .frame(width: logoSize.width, height: logoSize.height)
            .offset(y: -7)
    }
    
    var titleView: some View {
        title
            .offset(y: titleAnimation ? 0 : 110)
    }
    
    private func onAppear() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            withAnimation(.spring) {
                titleAnimation.toggle()
            }
            
            withAnimation(
                .interactiveSpring(
                    response: 0.3,
                    dampingFraction: 1,
                    blendDuration: 1,
                ),
            ) {
                endAnimation.wrappedValue.toggle()
                backgroundAnimation.toggle()
            }
        }
    }
}

#Preview {
    BaseView()
        .environmentObject(ProductStore())
        .environmentObject(UserStore())
}
