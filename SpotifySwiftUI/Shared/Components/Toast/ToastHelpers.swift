//
//  ToastHelper.swift
//  SpotifySwiftUI
//
//  Created by ladans on 29/08/25.
//

import SwiftUI

extension Binding<[Toast]> {
    func showToast() {
        withAnimation(.bouncy) {
            let toast = Toast { id in
                ToastView(id: id)
            }
            wrappedValue.append(toast)
        }
    }
    
    func delete(_ id: String) {
        withAnimation(.bouncy) {
            self.wrappedValue.removeAll { $0.id == id }
        }
    }
}
