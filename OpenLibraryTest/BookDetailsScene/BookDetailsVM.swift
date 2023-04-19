//
//  BookDetailsVM.swift
//  OpenLibraryTest
//
//  Created by Lobster on 16.04.23.
//

import UIKit

final class BookDetailsVM: BookDetailsVMProtocol {
    
    private weak var coordinator: BookDetailsCoordinatorProtocol?
    private var networkService: BookDetailsNetworkServiceProtocol
    private var imageDownloadService: BookDetailsImageDownloadServiceProtocol
    private var urlBuilder: BookDetailsURLBulderProtocol
    
    var book: Book
    
    init(coordinator: BookDetailsCoordinatorProtocol,
         networkService: BookDetailsNetworkServiceProtocol,
         imageDownloadService: BookDetailsImageDownloadServiceProtocol,
         urlBuilder: BookDetailsURLBulderProtocol,
         book: Book) {
        self.coordinator = coordinator
        self.networkService = networkService
        self.imageDownloadService = imageDownloadService
        self.urlBuilder = urlBuilder
        self.book = book
    }
    
    //MARK: - methods for loading image and description
    
    func loadBookCover(by id: Int,
                       handler: @escaping (UIImage?) -> Void) {
        let url = urlBuilder.buildURL(coverID: id, coverSize: "M")
        imageDownloadService.downloadImage(from: url) { image in
            DispatchQueue.main.async {
                handler(image)
            }
        }
    }
    
    func loadBookDescription(bookPath: String,
                                     handler: @escaping (String) -> Void) {
        networkService.loadBookDetails(bookPath: bookPath) { bookDetailsModel in
                let description = bookDetailsModel?.description?.value ??
                    "Here is no description from publisher"
                DispatchQueue.main.async {
                    handler(description)
            }
        }
    }
    
}
