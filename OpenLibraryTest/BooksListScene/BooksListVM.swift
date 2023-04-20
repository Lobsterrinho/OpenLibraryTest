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
    
    private weak var delegate: BooksListVMDelegate?
    
    private weak var coordinator: BooksListCoordinatorProtocol?
    private var networkService: BooksListNetworkServiceProtocol
    private var adapter: BooksListAdapterProtocol
    private var alertFactory: AlertControllerFactoryProtocol
    
    init(coordinator: BooksListCoordinatorProtocol,
         networkService: BooksListNetworkServiceProtocol,
         adapter: BooksListAdapterProtocol,
         alertFactory: AlertControllerFactoryProtocol) {
        self.coordinator = coordinator
        self.networkService = networkService
        self.adapter = adapter
        self.alertFactory = alertFactory
        adapter.setupBooksListAdapterActionDelegate(self)
    }
    
    func setupVMDelegate(_ delegate: BooksListVMDelegate) {
        self.delegate = delegate
    }
    
    private func setupBooks() {
        adapter.setupBooks(books: books)
    }
    
    func setupAdapter(with tableView: UITableView) {
        adapter.setupTableView(tableView)
        
    }
    
    func loadBooks() {
        networkService.loadBooks { result in
            switch result {
            case .failure(let error):
                self.presentAlert(title: "Error",
                             message: "\(error.localizedDescription)")
            case.success(let booksModel):
                self.books = booksModel.docs.map({ doc in
                    Book(bookKey: doc.key,
                         title: doc.title,
                         firstPublishDate: doc.firstPublishDate,
                         coverID: doc.coverID ?? -1,
                         descriprtion: doc.firstSentence?.first ?? "Here is no description",
                         averageRating: doc.averageRating)
                })
                self.setupBooks()
                self.delegate?.cellsDidLoaded(true)
            }
        }
    }
    
    private func presentAlert(title: String?, message: String?) {
        let alert = alertFactory.makeAlert(title: title,
                                           message: message,
                                           actions: [.cancel({
            
        })])
        coordinator?.presentAlert(alert)
    }
    
}

extension BooksListVM: BooksListAdapterActionDelegate {
    
    func didSelectItem(book: Book) {
        coordinator?.openBookDetailsScene(book: book)
    }
}
