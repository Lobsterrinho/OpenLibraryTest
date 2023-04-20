//
//  BooksListCoordinatorProtocol.swift
//  OpenLibraryTest
//
//  Created by Lobster on 13.04.23.
//

import Foundation
import UIKit

protocol BooksListCoordinatorProtocol: AnyObject {
    func finish()
    func openBookDetailsScene(book: Book)
    func presentAlert(_ alert: UIAlertController)
}
