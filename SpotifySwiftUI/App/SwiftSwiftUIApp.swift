//
//  SwiftUIClonesApp.swift
//  SwiftUIClones
//
//  Created by ladans on 02/07/25.
//

import SwiftUI

@main
struct SwiftSwiftUIApp: App {
    @StateObject var productStore = ProductStore()
    @StateObject var userStore = UserStore()
    
    var body: some Scene {
        WindowGroup {
            BaseView()
                .environmentObject(productStore)
                .environmentObject(userStore)
                .injectLogger()
        }
    }
}
