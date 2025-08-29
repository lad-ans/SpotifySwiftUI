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
        let (error, result) = await Service().getUsers()
        
        if let error = error {
            print("Failed to fetch users: \(error.message)")
        } else if let data = result {
            currentUser = data.users[3]
        }
    }
}
