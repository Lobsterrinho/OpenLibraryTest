//
//  BookTableViewCell.swift
//  OpenLibraryTest
//
//  Created by Lobster on 13.04.23.
//

import UIKit

class BookTableViewCell: UITableViewCell {
    
    @IBOutlet private weak var bookCover: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var dateLabel: UILabel!
    @IBOutlet private weak var indicator: UIActivityIndicatorView!
    
    var viewModel: BookCellVMProtocol!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        bookCover.image = nil
        viewModel.prepareForReuse()
    }
    
    func setup(book: Book) {
        titleLabel.text = book.title
        dateLabel.text = String(book.firstPublishDate)
        
        let coverId = book.coverID
        startLoader()
        viewModel.loadImage(by: coverId) { [weak self] in
            self?.stopLoader()
            self?.bookCover.image = $0
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
}
