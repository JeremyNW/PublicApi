//
//  Category.swift
//  PublicApi
//
//  Created by Jeremy Warren on 10/5/21.
//

import Foundation

struct EntryResponse: Decodable {
    let entries: [Entry]
}


struct Entry: Decodable {
    let name: String
    let description: String
    let auth: String
    let isHttps: Bool
    let cors: String
    let link: URL
    
    enum CodingKeys: String, CodingKey {
        case name = "API"
        case description = "Description"
        case auth = "Auth"
        case isHttps = "HTTPS"
        case cors = "Cors"
        case link = "Link"
    }
}
