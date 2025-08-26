//
//  File.swift
//  SpotifySwiftUI
//
//  Created by ladans on 26/08/25.
//

import SwiftUI

extension BaseView {
    func onChange() {
        let newOffset = gestureOffset + oldOffset
        offset = gestureOffset != 0
        ? (newOffset < 0 ? 0 : (newOffset > sideBarWidth ? sideBarWidth : newOffset))
        : offset
    }
    
    func onEnd(value: DragGesture.Value) {
        let velocityX = value.velocity.width
        let translation = value.translation.width
        
        let baseDistance: CGFloat = sideBarWidth
        let minDuration = 0.15
        let maxDuration = 0.4
        let computedDuration = min(max(Double(1.0 - abs(translation) / baseDistance) * maxDuration, minDuration), maxDuration)
        
        let dragThreshold = sideBarWidth * 0.4
        let swipeReverseThreshold = velocityX < -800
        let swipeForwardThreshold = velocityX > 800
        
        let isOpenThresholdReached = translation > dragThreshold || swipeForwardThreshold
        let isCloseThresholdUnreached = translation < 0 && translation > -dragThreshold && !swipeReverseThreshold
        
        withAnimation(.easeOut(duration: computedDuration)) {
            if isOpenThresholdReached || isCloseThresholdUnreached {
                offset = sideBarWidth
                showMenu = true
                print("AQUI1")
            } else {
                offset = 0
                showMenu = false
                print("AQUI2")
            }
            oldOffset = offset
        }
    }
    
    func resetSideMenuState() {
        showMenu = false
        offset = 0;
        oldOffset = offset
    }
}
