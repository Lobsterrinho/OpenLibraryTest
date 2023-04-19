//
//  BookDetailsVC.swift
//  OpenLibraryTest
//
//  Created by Lobster on 16.04.23.
//

import UIKit

final class BookDetailsVC: UIViewController {
    
    @IBOutlet private weak var bookCover: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var dateLabel: UILabel!
    @IBOutlet private weak var indicator: UIActivityIndicatorView!
    @IBOutlet private weak var descriptionTextView: UITextView! {
        didSet {
            descriptionTextView.layer.cornerRadius = 7.0
        }
    }
    @IBOutlet private weak var titleView: UIView! {
        didSet {
            titleView.layer.cornerRadius = 7.0
        }
    }
    @IBOutlet private weak var dateView: UIView! {
        didSet {
            dateView.layer.cornerRadius = 7.0
        }
    }
    
    private var viewModel: BookDetailsVMProtocol
    
    init(viewModel: BookDetailsVMProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startLoader()
        setupLabels()
        setupBookCover()
//        setupBookDescription()
    }
    
    private func startLoader() {
        indicator.isHidden = false
        indicator.startAnimating()
    }
    
    private func stopLoader() {
        indicator.stopAnimating()
        indicator.isHidden = true
    }
    
    private func setupBookCover() {
        viewModel.loadBookCover(by: viewModel.book.coverID) { image in
            self.bookCover.image = image
            self.stopLoader()
        }
    }
    
    private func setupLabels() {
        titleLabel.text = viewModel.book.title
        dateLabel.text = String(viewModel.book.firstPublishDate)
        descriptionTextView.text = viewModel.book.descriprtion
    }
    
    private func setupBookDescription() {
        viewModel.loadBookDescription(
            bookPath: viewModel.book.bookKey
        ) { description in
            self.descriptionTextView.text = description
        }
    }
}
