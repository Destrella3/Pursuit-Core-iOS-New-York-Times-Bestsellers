//
//  NYTBestsellers.swift
//  NYTBestsellers
//
//  Created by Diego Estrella III on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation

struct NYTBestseller: Codable {
    let results: [Books]
}

struct Books: Codable {
   let listName: String
    enum CodingKeys: String, CodingKey {
        case listName = "list_name"
    }
}

