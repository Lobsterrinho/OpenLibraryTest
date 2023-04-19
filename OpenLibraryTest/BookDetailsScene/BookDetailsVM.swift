//
//  BookDetailsVM.swift
//  OpenLibraryTest
//
//  Created by Lobster on 16.04.23.
//

import UIKit

final class BookDetailsVM: BookDetailsVMProtocol {
    
    private weak var coordinator: BookDetailsCoordinatorProtocol?
    private var imageDownloadService: BookDetailsImageDownloadServiceProtocol
    private var urlBuilder: BookDetailsURLBulderProtocol
    
    var book: Book
    
    init(coordinator: BookDetailsCoordinatorProtocol,
         imageDownloadService: BookDetailsImageDownloadServiceProtocol,
         urlBuilder: BookDetailsURLBulderProtocol,
         book: Book) {
        self.coordinator = coordinator
        self.imageDownloadService = imageDownloadService
        self.urlBuilder = urlBuilder
        self.book = book
    }
    
    func finish(shouldMovetoParentVC: Bool) {
        coordinator?.finish(shouldMovetoParentVC)
    }
    
    func loadBookCover(by id: Int,
                       handler: @escaping (UIImage?) -> Void) {
        let url = urlBuilder.buildURL(coverID: id, coverSize: "M")
        imageDownloadService.downloadImage(from: url) { image in
            DispatchQueue.main.async {
                handler(image)
            }
        }
    }
    
}
