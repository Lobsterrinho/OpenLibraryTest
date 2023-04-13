//
//  BooksListVC.swift
//  OpenLibraryTest
//
//  Created by Lobster on 13.04.23.
//

import UIKit

final class BooksListVC: UIViewController {
    
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
        view.backgroundColor = .cyan
    }
}
