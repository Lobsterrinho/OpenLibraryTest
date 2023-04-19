//
//  BooksListVM.swift
//  OpenLibraryTest
//
//  Created by Lobster on 13.04.23.
//

import Foundation
import UIKit

final class BooksListVM: BooksListVMProtocol {
    
    private var books: [Book] = []
    
    private weak var VMDelegate: BooksListVMDelegate?
    
    private weak var coordinator: BooksListCoordinatorProtocol?
    private var networkService: BooksListNetworkServiceProtocol
    private var adapter: BooksListAdapterProtocol
    
    init(coordinator: BooksListCoordinatorProtocol,
         networkService: BooksListNetworkServiceProtocol,
         adapter: BooksListAdapterProtocol) {
        self.coordinator = coordinator
        self.networkService = networkService
        self.adapter = adapter
        adapter.setupBooksListAdapterActionDelegate(self)
    }
    
    func setupVMDelegate(_ delegate: BooksListVMDelegate) {
        self.VMDelegate = delegate
    }
    
    private func setupBooks() {
        adapter.setupBooks(books: books)
    }
    
    func setupAdapter(with tableView: UITableView) {
        adapter.setupTableView(tableView)
        
    }
    
    func loadBooks() {
        networkService.loadBooks { booksModel in
            self.books = booksModel.docs.map({ doc in
                Book(bookKey: doc.key,
                      title: doc.title,
                      firstPublishDate: doc.firstPublishDate,
                     coverID: doc.coverID ?? -1,
                     descriprtion: doc.firstSentence?.first ?? "Here is no description")
            })
            self.setupBooks()
            self.VMDelegate?.cellsDidLoaded(true)
            
        }
    }
}

extension BooksListVM: BooksListAdapterActionDelegate {
    
    func didSelectItem(book: Book) {
        coordinator?.openBookDetailsScene(book: book)
    }
}
