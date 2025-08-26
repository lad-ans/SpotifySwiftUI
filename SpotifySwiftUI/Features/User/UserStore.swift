//
//  UserStore.swift
//  SwiftUIClones
//
//  Created by ladans on 17/08/25.
//

import Foundation
import Combine

class UserStore: ObservableObject {
    @Published var currentUser: User?
    
    init() {
        Task {
            await getUser()
        }
    }
    
    private func getUser() async {
        do {
            currentUser = try await DatabaseHelper().getUsers()[1]
        } catch {}
    }
}
