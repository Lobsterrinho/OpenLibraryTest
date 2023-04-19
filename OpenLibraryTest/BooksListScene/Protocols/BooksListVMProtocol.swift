//
//  BooksListVMProtocol.swift
//  OpenLibraryTest
//
//  Created by Lobster on 13.04.23.
//

import UIKit

protocol BooksListVMProtocol {
    func setupAdapter(with tableView: UITableView)
    func setupVMDelegate(_ delegate: BooksListVMDelegate)
    func loadBooks()
}
