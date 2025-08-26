//
//  View+Modifiers.swift
//  SpotifySwiftUI
//
//  Created by ladans on 26/08/25.
//

import SwiftUI

extension View {
    func sideMenuPreferences(
        oldOffset: Binding<CGFloat>,
        offset: Binding<CGFloat>,
        showMenu: Bool,
        onEnd: @escaping (DragGesture.Value) -> Void,
        onChange: @escaping () -> Void,
        gestureOffset: GestureState<CGFloat>,
    ) -> some View {
        frame(width: getRect().width + sideBarWidth)
            .offset(x: -sideBarWidth)
            .offset(x: offset.wrappedValue > 0 ? offset.wrappedValue : 0)
            .gesture(
                DragGesture()
                    .updating(gestureOffset, body: { value, out, _ in
                        out = value.translation.width
                    })
                    .onEnded(onEnd)
            )
            .onChange(of: showMenu) {
                if showMenu && offset.wrappedValue == 0 {
                    withAnimation(.easeOut(duration: 0.25)) {
                        offset.wrappedValue = sideBarWidth
                        oldOffset.wrappedValue = offset.wrappedValue
                    }
                }
                
                if !showMenu && offset.wrappedValue == sideBarWidth {
                    withAnimation(.easeOut(duration: 0.25)) {
                        offset.wrappedValue = 0
                        oldOffset.wrappedValue = 0
                    }
                }
            }
            .onChange(of: gestureOffset.wrappedValue, onChange)
    }
    
    func sideMenuContentOverlay(
        overlayColor: Color? = nil,
        showMenu: Binding<Bool>,
        onReset: @escaping () -> Void,
    ) -> some View {
        overlay {
            Rectangle()
                .fill((overlayColor ?? Color.black).opacity(showMenu.wrappedValue ? 0.5 : 0.0))
                .ignoresSafeArea(.container, edges: .vertical)
                .onTapGesture {
                    withAnimation(.easeInOut(duration: 0.4)) {
                        onReset()
                    }
                }
        }
    }
}
