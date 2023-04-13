//
//  BooksListAssembler.swift
//  OpenLibraryTest
//
//  Created by Lobster on 13.04.23.
//

import Foundation
import UIKit

final class BooksListAssembler {
    
    private init(){ }
    
    static func makeBooksListVC(coordinator: BooksListCoordinatorProtocol) -> UIViewController {
        let viewModel = BooksListVM(coordinator: coordinator)
        return BooksListVC(viewModel: viewModel)
    }
    
    private static func makeViewModel(coordinator: BooksListCoordinatorProtocol) -> BooksListVMProtocol {
        return BooksListVM(coordinator: coordinator)
    }
}
