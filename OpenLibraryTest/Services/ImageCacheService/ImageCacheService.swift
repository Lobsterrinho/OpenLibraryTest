//
//  ImageCacheService.swift
//  OpenLibraryTest
//
//  Created by Lobster on 19.04.23.
//

import UIKit

final class ImageCacheService {
    
    static let shared: ImageCacheService = .init()
    
    private let cache: NSCache<NSString, UIImage> = .init()
    
    func get(for key: String) -> UIImage? {
        return cache.object(forKey: key as NSString)
    }
    
    func set(value: UIImage, for key: String) {
        cache.setObject(value, forKey: key as NSString)
    }
    
}

