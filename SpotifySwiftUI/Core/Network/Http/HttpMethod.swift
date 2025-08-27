//
//  HttpMethod.swift
//  SpotifySwiftUI
//
//  Created by ladans on 27/08/25.
//

import Foundation

enum HttpMethod: String {
    case POST, PUT, GET, DELETE
    
    var method: String {
        rawValue
    }
}
