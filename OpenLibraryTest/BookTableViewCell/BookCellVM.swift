//
//  BookCellViewModel.swift
//  OpenLibraryTest
//
//  Created by Lobster on 19.04.23.
//

import UIKit

final class BookCellVM: BookCellVMProtocol {
    
    private var imageDownloadService: BookCellImageDownloadServiceProtocol
    private var urlBuilder: BookCellURLBuilderProtocol
    
    init(imageDownloadService: BookCellImageDownloadServiceProtocol,
         urlBuilder: BookCellURLBuilderProtocol) {
        self.imageDownloadService = imageDownloadService
        self.urlBuilder = urlBuilder
    }
    
    func prepareForReuse() {
        imageDownloadService.cancelCurrentDownload()
    }
    
    func loadImage(by id: Int, handler: @escaping (UIImage?) -> Void) {
        let url = urlBuilder.buildURL(coverID: id, coverSize: "M")
        imageDownloadService.downloadImage(from: url) { image in
            
            DispatchQueue.main.async {
                handler(image)
            }
        }
    }
}
