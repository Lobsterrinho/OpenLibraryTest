//
//  BooksModel.swift
//  OpenLibraryTest
//
//  Created by Lobster on 14.04.23.
//

import Foundation

struct BooksModel: Decodable {
    let docs: [Doc]
}

struct Doc: Decodable {
    let key: String
    let title: String
    let firstPublishDate: Int
    let coverID: Int?
    let firstSentence: [String]?
    let averageRating: Double?
    
    enum CodingKeys: String, CodingKey {
        case key
        case title
        case firstPublishDate = "first_publish_year"
        case coverID = "cover_i"
        case firstSentence = "first_sentence"
        case averageRating = "ratings_average"
    }
}


