//
//  NYTBestsellerCollectionAPIClient.swift
//  NYTBestsellers
//
//  Created by Diego Estrella III on 1/29/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation

final class NYTBestsellerCollectionAPIClient {
    static func getCollection(list: String, onCompletion: @escaping ((AppError?, [BookData]?) -> Void)) {
        NetworkHelper.shared.performDataTask(endpointURLString: "https://api.nytimes.com/svc/books/v3/lists.json?api-key=\(SecretKey.APIKey)&list=\(list)") { (appError, data) in
            if let appError = appError {
                onCompletion(appError, nil)
            } else if let data = data {
                do {
                    let collection = try JSONDecoder().decode(NYTBestsellerCollection.self, from: data)
                    onCompletion(nil, collection.results)
                } catch {
                    onCompletion(AppError.jsonDecodingError(error), nil)
                }
            }
        }
    }
}

