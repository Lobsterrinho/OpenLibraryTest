//
//  NetworkService.swift
//  OpenLibraryTest
//
//  Created by Lobster on 13.04.23.
//

import Foundation
import UIKit

typealias ResultHandler = (Result<BooksModel, Error>) -> Void

final class NetworkService {
    
    func loadBooks(completion: @escaping ResultHandler) {
        guard let url = URL(string: "https://openlibrary.org/search.json?q=*&limit=20")
        else { return }
        
        var request = URLRequest(url: url)
        request.timeoutInterval = 20
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) {
            responseData,
            response,
            error in
            if let error = error {
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
            } else if let jsonData = responseData {
                let books = try? JSONDecoder().decode(BooksModel.self, from: jsonData)
                DispatchQueue.main.async {
                    completion(.success(books ?? BooksModel(docs: [])))
                }
            }
        }
        task.resume()
    }
}

