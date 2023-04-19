//
//  BooksListAdapterActionDelegate.swift
//  OpenLibraryTest
//
//  Created by Lobster on 14.04.23.
//

import UIKit

protocol BooksListAdapterActionDelegate: AnyObject {
    func didSelectItem(book: Book)
}
