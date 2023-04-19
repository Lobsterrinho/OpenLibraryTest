//
//  BooksListAdapterProtocol.swift
//  OpenLibraryTest
//
//  Created by Lobster on 14.04.23.
//

import UIKit

protocol BooksListAdapterProtocol {
    
    func setupTableView(_ tableView: UITableView)
    func setupBooks(books: [Book])
    func setupBooksListAdapterActionDelegate(_ delegate: BooksListAdapterActionDelegate)
    func reloadData()
}
