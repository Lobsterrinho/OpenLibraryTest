//
//  ImageDownloadService.swift
//  OpenLibraryTest
//
//  Created by Lobster on 19.04.23.
//

import Foundation
import UIKit

typealias DownloadHandler = (UIImage?) -> Void

final class ImageDownloadService {
    
    private var cache: ImageCacheService
    
    private var currentTask: URLSessionDownloadTask?
    private var currentRequest: URLRequest?
    
    init(cache: ImageCacheService) {
        self.cache = cache
    }
    
    func downloadImage(from urlStr: String,
                       completion: @escaping DownloadHandler) {
        if let cachedImage = cache.get(for: urlStr) {
            completion(cachedImage)
            return
        }
        
        guard let url = URL(string: urlStr) else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        currentRequest = request
        
        currentTask = URLSession.shared.downloadTask(
            with: request
        ) { [weak self] fileURL, response, error in
            guard response?.url == self?.currentRequest?.url else { return }
            
            if let url = fileURL,
               let data = try? Data(contentsOf: url),
               let image = UIImage(data: data) {
                self?.cache.set(value: image, for: urlStr)
                completion(image)
            } else {
                let noImage = UIImage(named: "noImage")!
                self?.cache.set(value: noImage, for: urlStr)
                completion(noImage)
            }
        }
        currentTask?.resume()
    }
    
    func cancelCurrentDownload() {
        currentTask?.cancel()
        currentRequest = nil
    }
}
