//
//  BookCellURLBuilderProtocol.swift
//  OpenLibraryTest
//
//  Created by Lobster on 19.04.23.
//

import Foundation

protocol BookCellURLBuilderProtocol {
    
    func buildURL(coverID: Int, coverSize: String) -> String
}
