//
//  BookDetailsURLBulderProtocol.swift
//  OpenLibraryTest
//
//  Created by Lobster on 19.04.23.
//

import Foundation

protocol BookDetailsURLBulderProtocol {
    
    func buildURL(coverID: Int, coverSize: String) -> String
}
