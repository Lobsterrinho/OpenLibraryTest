//
//  BooksListAdapter.swift
//  OpenLibraryTest
//
//  Created by Lobster on 14.04.23.
//

import UIKit

final class BooksListAdapter: NSObject, BooksListAdapterProtocol {
    
    private weak var tableView: UITableView?
    private var books: [Book] = []
    
    private weak var actionDelegate: BooksListAdapterActionDelegate?
    
    func setupTableView(_ tableView: UITableView) {
        self.tableView = tableView
        setupTableView()
    }
    
    func setupBooks(books: [Book]) {
        self.books = books
        reloadData()
    }
    
    func reloadData() {
        tableView?.reloadData()
    }
    
    private func setupTableView() {
        tableView?.delegate = self
        tableView?.dataSource = self
        registerCell()
    }
    
    private func registerCell() {
        let nib = UINib(nibName: ("\(BookTableViewCell.self)"), bundle: nil)
        tableView?.register(nib,
                            forCellReuseIdentifier: "\(BookTableViewCell.self)")
    }
    
    func setupBooksListAdapterActionDelegate(_ delegate: BooksListAdapterActionDelegate) {
        self.actionDelegate = delegate
    }
}

extension BooksListAdapter: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return books.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: "\(BookTableViewCell.self)",
            for: indexPath
        ) as? BookTableViewCell
        
        cell?.viewModel = BookCellVMAssembler.makeVM()
        let book = books[indexPath.row]
        cell?.setup(book: book)
        return cell ?? UITableViewCell()
    }
}

extension BooksListAdapter: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let book = books[indexPath.row]
        actionDelegate?.didSelectItem(book: book)
    }
}

