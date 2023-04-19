//
//  BookDetailsCoordinatorProtocol.swift
//  OpenLibraryTest
//
//  Created by Lobster on 16.04.23.
//

import Foundation

protocol BookDetailsCoordinatorProtocol: AnyObject {
    func finish()
    func finish(_ shouldMovetoParentVC: Bool)
}
