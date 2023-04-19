//
//  BookDetailsImageDownloadServiceProtocol.swift
//  OpenLibraryTest
//
//  Created by Lobster on 19.04.23.
//

import Foundation

protocol BookDetailsImageDownloadServiceProtocol {
    
    func downloadImage(from urlStr: String,
                       completion: @escaping DownloadHandler)
}
