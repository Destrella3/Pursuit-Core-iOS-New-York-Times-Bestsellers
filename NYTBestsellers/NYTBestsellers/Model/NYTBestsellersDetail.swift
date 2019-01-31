//
//  NYTBestsellersDetail.swift
//  NYTBestsellers
//
//  Created by Diego Estrella III on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation

struct NYTBestSellersDetail: Codable {
    let items: [VolumnInfo]
   
}

struct VolumnInfo: Codable {
    let volumeInfo: [BookInfo]
}

struct BookInfo: Codable {
    let title: String
    let description: String
    let smallThumbnail: String
    let thumbnail: String
}
