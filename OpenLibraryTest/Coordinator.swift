//
//  Coordinator.swift
//  OpenLibraryTest
//
//  Created by Lobster on 13.04.23.
//

import Foundation

protocol Coordinator: AnyObject {
    
    var childCoordinators: [Coordinator] { get }
    
    func start()
    func finish()
}
