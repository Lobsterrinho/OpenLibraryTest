//
//  BookDetailsVMProtocol.swift
//  OpenLibraryTest
//
//  Created by Lobster on 16.04.23.
//

import Foundation
import UIKit

protocol BookDetailsVMProtocol {
    
    var book: Book { get }
    func loadBookCover(by id: Int,
                       handler: @escaping (UIImage?) -> Void)
    func loadBookDescription(bookPath: String,
                                     handler: @escaping (String) -> Void)
    func finish(shouldMovetoParentVC: Bool)
}
