//
//  BookCellVMProtocol.swift
//  OpenLibraryTest
//
//  Created by Lobster on 19.04.23.
//

import UIKit

protocol BookCellVMProtocol {
    func prepareForReuse()
    func loadImage(by id: Int,
                   handler: @escaping (UIImage?) -> Void)
}
