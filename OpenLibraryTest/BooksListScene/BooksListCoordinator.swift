//
//  BooksListCoordinator.swift
//  OpenLibraryTest
//
//  Created by Lobster on 13.04.23.
//

import Foundation
import UIKit

final class BooksListCoordinator: Coordinator {
    
    private var rootNavigationController: UINavigationController
    private var rootCoordinator: BooksListRootCoordinatorProtocol
    
    var childCoordinators: [Coordinator] = []
    
    init(rootNavigationController: UINavigationController,
         rootCoordinator: BooksListRootCoordinatorProtocol) {
        self.rootNavigationController = rootNavigationController
        self.rootCoordinator = rootCoordinator
    }
    
    func start() {
        let rootViewController = BooksListAssembler.makeBooksListVC(coordinator: self)
        rootNavigationController.pushViewController(rootViewController, animated: false)
    }
    
    func finish() {
        rootNavigationController.popViewController(animated: true)
        rootCoordinator.booksListSceneFinished(self)
    }
    
}

extension BooksListCoordinator: BooksListCoordinatorProtocol {
    
    
}
