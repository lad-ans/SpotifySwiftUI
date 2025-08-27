//
//  HttpClient.swift
//  SpotifySwiftUI
//
//  Created by ladans on 27/08/25.
//

import Foundation

protocol HttpClientProtocol {
    func send<T: Codable>(_ request: URLRequest, responseType: T.Type) async throws -> Either<T>
}

class HttpClient: HttpClientProtocol {
    func send<T: Codable>(_ request: URLRequest, responseType: T.Type) async -> Either<T> {
        do {
            let (data, response) = try await URLSession.shared.data(for: request)
            
            if !data.isEmpty {
                let result = try JSONDecoder().decode(T.self, from: data)
                return (nil, result)
            }
            
            if let httpResponse = response as? HTTPURLResponse {
                return (Failure.server(code: httpResponse.statusCode), nil)
            }
            
            return (Failure.server(code: 0), nil)
        } catch {
            return (Failure.server(error: error), nil)
        }
    }
}
