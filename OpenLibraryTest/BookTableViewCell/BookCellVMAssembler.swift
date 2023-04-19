//
//  BookCellVMAssembler.swift
//  OpenLibraryTest
//
//  Created by Lobster on 19.04.23.
//

import Foundation

final class BookCellVMAssembler {
    
    private init() { }
    
    static func makeVM() -> BookCellVMProtocol {
        return BookCellVM(imageDownloadService: makeImageDownloadService(),
                          urlBuilder: makeURLBuilder())
    }
    
    private static func makeImageDownloadService() -> BookCellImageDownloadServiceProtocol {
        return ImageDownloadServiceAssembler.makeImageDownloadService()
    }
    
    private static func makeURLBuilder() -> BookCellURLBuilderProtocol {
        return URLBuilder()
    }
}
