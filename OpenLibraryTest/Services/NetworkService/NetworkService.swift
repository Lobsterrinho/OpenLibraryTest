//
//  NetworkService.swift
//  OpenLibraryTest
//
//  Created by Lobster on 13.04.23.
//

import Foundation
import UIKit

final class NetworkService {
    
    func loadBooks(completion: @escaping (BooksModel) -> Void) {
        guard let url = URL(string: "https://openlibrary.org/search.json?q=*&limit=20")
        else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request) { responseData, response, error in
            if let error = error {
                print(error.localizedDescription)
            } else if let jsonData = responseData {
                let books = try? JSONDecoder().decode(BooksModel.self, from: jsonData)
                DispatchQueue.main.async {
                    completion(books ?? BooksModel(docs: []))
                }
            }
        }.resume()
    }
    
}

