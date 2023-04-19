//
//  BookCellImageDownloadServiceProtocol.swift
//  OpenLibraryTest
//
//  Created by Lobster on 19.04.23.
//

import UIKit

protocol BookCellImageDownloadServiceProtocol {
    
    func downloadImage(from urlStr: String,
                       completion: @escaping DownloadHandler)
    func cancelCurrentDownload()
}
