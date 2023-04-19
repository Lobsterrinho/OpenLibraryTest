//
//  BooksListVC.swift
//  OpenLibraryTest
//
//  Created by Lobster on 13.04.23.
//

import UIKit

final class BooksListVC: UIViewController {
    
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var indicator: UIActivityIndicatorView!
    
    private var viewModel: BooksListVMProtocol
    
    init(viewModel: BooksListVMProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.loadBooks()
        viewModel.setupAdapter(with: tableView)
        viewModel.setupVMDelegate(self)
        indicator.startAnimating()
        title = "Books"
    }
    
}

extension BooksListVC: BooksListVMDelegate {
    func cellsDidLoaded(_ loaded: Bool) {
        if loaded {
            indicator.stopAnimating()
            indicator.isHidden = true
        }
    }
}
