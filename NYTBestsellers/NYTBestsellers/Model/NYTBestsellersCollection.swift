//
//  NYTBestsellersCollection.swift
//  NYTBestsellers
//
//  Created by Diego Estrella III on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation

struct NYTBestsellerCollection: Codable {
    let results: [BookData]
}

struct BookData: Codable {
    let isbns: [ISBNS]
    let bookDetails: [Collection]
    let listName: String
    let weeksOnList: Int
    let amazonProductUrl: String
    enum CodingKeys: String, CodingKey {
        case isbns
        case listName = "list_name"
        case bookDetails = "book_details"
        case weeksOnList = "weeks_on_list"
        case amazonProductUrl = "amazon_product_url"
    }
}

struct ISBNS: Codable {
    let isbn13: String
}

struct Collection: Codable {
    let title: String
    let description: String
}
