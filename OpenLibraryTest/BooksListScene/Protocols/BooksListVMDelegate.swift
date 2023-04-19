//
//  BooksListVMDelegate.swift
//  OpenLibraryTest
//
//  Created by Lobster on 16.04.23.
//

import Foundation

protocol BooksListVMDelegate: AnyObject {
    func cellsDidLoaded(_ loaded: Bool)
}
