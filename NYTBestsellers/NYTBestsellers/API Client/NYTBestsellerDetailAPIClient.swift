//
//  NYTBestsellerDetailAPIClient.swift
//  NYTBestsellers
//
//  Created by Diego Estrella III on 1/29/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation

final class NYTBestsellerDetailAPIClient {
    static func getDetails(onCompletion: @escaping ((AppError?, [VolumnInfo]?) -> Void)) {
        NetworkHelper.shared.performDataTask(endpointURLString: "https://www.googleapis.com/books/v1/volumes?q=isbn:9780735219113&key=\(SecretKey.GoogleKey)") { (appError, data) in
            if let appError = appError {
                onCompletion(appError, nil)
            } else if let data = data {
                do {
                    let bookInfo = try JSONDecoder().decode(NYTBestSellersDetail.self, from: data)
                    onCompletion(nil, bookInfo.items)
                } catch {
                    onCompletion(AppError.jsonDecodingError(error), nil)
                }
            }
        }
    }
}
