//
//  BookDetailsCoordinator.swift
//  OpenLibraryTest
//
//  Created by Lobster on 16.04.23.
//

import UIKit

final class BookDetailsCoordinator: Coordinator {
    
    private var navigationController: UINavigationController
    private var rootCoordinator: BookDetailsRootCoordinatorProtocol
    
    var childCoordinators: [Coordinator] = []
    
    init(navigationController: UINavigationController,
         rootCoordinator: BookDetailsRootCoordinatorProtocol) {
        self.navigationController = navigationController
        self.rootCoordinator = rootCoordinator
    }
    
    func start() {
        assert(false, "Should be open with login, please use start(delegate:)")
    }
    
    func start(book: Book) {
        let rootViewController = BookDetailsAssembler.makeBookDetailsVC(coordinator: self,
                                                                        book: book)
        navigationController.pushViewController(rootViewController, animated: true)
    }
    
    func finish() {
        rootCoordinator.bookDetailsSceneFinished(self)
    }
    
}

extension BookDetailsCoordinator: BookDetailsCoordinatorProtocol {
    
    func finish(_ shouldMovetoParentVC: Bool) {
        if shouldMovetoParentVC {
            navigationController.popViewController(animated: true)
        }
        finish()
    }
}



