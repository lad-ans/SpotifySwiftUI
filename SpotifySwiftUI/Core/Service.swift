//
//  DatabaseHelper.swift
//  SwiftUIPractice
//
//  Created by Developer on 02/07/25.
//

import Foundation

struct Service {
    let httpClient: HttpClient = HttpClient()
    var request: HttpRequest = HttpRequest(baseURL: "https://dummyjson.com/")
    
    func getProdcuts() async -> Either<ProductArray> {
        return await httpClient.send(
            request
                .path("products")
                .method(.GET),
            responseType: ProductArray.self
        )
    }
    
    func getUsers() async -> Either<UserArray> {
        return await httpClient.send(
            request
                .path("users")
                .method(.GET),
            responseType: UserArray.self
        )
    }
}
