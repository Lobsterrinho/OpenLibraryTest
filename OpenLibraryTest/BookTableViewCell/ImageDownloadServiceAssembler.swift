//
//  ImageDownloadServiceAssembler.swift
//  OpenLibraryTest
//
//  Created by Lobster on 19.04.23.
//

import Foundation

final class ImageDownloadServiceAssembler {
    
    private init() { }
    
    static func makeImageDownloadService() -> BookCellImageDownloadServiceProtocol {
        return ImageDownloadService(cache: .shared)
    }
}
