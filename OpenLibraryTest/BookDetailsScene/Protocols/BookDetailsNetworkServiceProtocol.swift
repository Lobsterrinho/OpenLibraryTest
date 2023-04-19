//
//  BookDetailsNetworkServiceProtocol.swift
//  OpenLibraryTest
//
//  Created by Lobster on 16.04.23.
//

import UIKit

protocol BookDetailsNetworkServiceProtocol {
    func loadBookDetails(bookPath: String ,completion: @escaping (BookDetailsModel?) -> Void)
}
