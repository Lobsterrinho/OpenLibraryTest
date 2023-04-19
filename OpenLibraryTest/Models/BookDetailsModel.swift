//
//  BookDetailsModel.swift
//  OpenLibraryTest
//
//  Created by Lobster on 16.04.23.
//

import UIKit

struct BookDetailsModel: Decodable {
    let description: Created?
}

struct Created: Decodable {
    let value: String?
}

