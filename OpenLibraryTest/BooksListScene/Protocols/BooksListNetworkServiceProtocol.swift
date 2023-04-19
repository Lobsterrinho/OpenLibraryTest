//
//  NetworkServiceProtocol.swift
//  OpenLibraryTest
//
//  Created by Lobster on 13.04.23.
//

import UIKit

protocol BooksListNetworkServiceProtocol {
    func loadBooks(completion: @escaping (BooksModel) -> Void)
}
