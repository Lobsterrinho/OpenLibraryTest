//
//  BookDetailsImageDowloadServiceAssembler.swift
//  OpenLibraryTest
//
//  Created by Lobster on 19.04.23.
//

import Foundation

final class BookDetailsImageDowloadServiceAssembler {
    
    private init() { }
    
    static func makeImageDownloadService() -> BookDetailsImageDownloadServiceProtocol {
        return ImageDownloadService(cache: .shared)
    }
}
