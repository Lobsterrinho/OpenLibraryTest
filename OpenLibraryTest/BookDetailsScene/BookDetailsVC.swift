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
    @IBOutlet private weak var ratingLabel: UILabel!
    @IBOutlet private weak var indicator: UIActivityIndicatorView!
    @IBOutlet private weak var descriptionTextView: UITextView! {
        didSet {
            descriptionTextView.layer.cornerRadius = 7.0
        }
    }
    @IBOutlet private var views: [UIView]! {
        didSet {
            views.forEach { view in
                view.layer.cornerRadius = 7.0
            }
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
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        if isMovingFromParent {
            viewModel.finish(shouldMovetoParentVC: true)
        }
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
        if let rating = viewModel.book.averageRating {
            ratingLabel.text = String(rating)
        } else {
            ratingLabel.text = "Not rated"
        }
    }
    
}
