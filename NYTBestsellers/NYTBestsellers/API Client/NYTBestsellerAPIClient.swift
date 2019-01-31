//
//  NYTBestsellerAPIClient.swift
//  NYTBestsellers
//
//  Created by Diego Estrella III on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation

final class NYTBestsellerAPIClient {
    static func getCategory(onCompletion: @escaping ((AppError?, [Books]?) -> Void)) {
        NetworkHelper.shared.performDataTask(endpointURLString: "https://api.nytimes.com/svc/books/v3/lists/names.json?api-key=\(SecretKey.APIKey)") { (appError, data) in
            if let appError = appError {
                onCompletion(appError, nil)
            }
            if let data = data {
                do {
                    let book = try JSONDecoder().decode(NYTBestseller.self, from: data)
                    onCompletion(nil, book.results)
                } catch {
                    onCompletion(AppError.jsonDecodingError(error), nil)
                }
            }
        }
    }
}
