//
//  BooksListVM.swift
//  OpenLibraryTest
//
//  Created by Lobster on 13.04.23.
//

import Foundation
import UIKit

final class BooksListVM: BooksListVMProtocol {
    
    private weak var coordinator: BooksListCoordinatorProtocol?
    
    init(coordinator: BooksListCoordinatorProtocol) {
        self.coordinator = coordinator
    }
}
