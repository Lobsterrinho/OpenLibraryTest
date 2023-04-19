//
//  URLBuilderService.swift
//  OpenLibraryTest
//
//  Created by Lobster on 19.04.23.
//

import Foundation

final class URLBuilder {
    
    func buildURL(coverID: Int, coverSize: String) -> String {
        return "https://covers.openlibrary.org/b/id/\(coverID)-\(coverSize).jpg"
    }       
}
