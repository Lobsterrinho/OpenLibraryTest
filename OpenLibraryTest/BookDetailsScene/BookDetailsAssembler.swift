//
//  BookDetailsAssembler.swift
//  OpenLibraryTest
//
//  Created by Lobster on 16.04.23.
//

import Foundation
import UIKit

final class BookDetailsAssembler {
    private init() { }
    
    static func makeBookDetailsVC(coordinator: BookDetailsCoordinatorProtocol,
                                  book: Book) -> UIViewController {
        let viewModel = makeViewModel(coordinator: coordinator,
                                      book: book)
        return BookDetailsVC(viewModel: viewModel)
    }
    
    private static func makeViewModel(coordinator: BookDetailsCoordinatorProtocol,
                                      book: Book) -> BookDetailsVMProtocol {
        return BookDetailsVM(coordinator: coordinator,
                             networkService: makeNetworkService(),
                             imageDownloadService: makeImageDownloadService(),
                             urlBuilder: makeURLBuilder(),
                             book: book)
    }
    
    private static func makeNetworkService() -> BookDetailsNetworkServiceProtocol {
        return NetworkService()
    }
    
    private static func makeImageDownloadService() -> BookDetailsImageDownloadServiceProtocol {
        return BookDetailsImageDowloadServiceAssembler.makeImageDownloadService()
    }
    
    private static func makeURLBuilder() -> BookDetailsURLBulderProtocol {
        return URLBuilder()
    }
}
