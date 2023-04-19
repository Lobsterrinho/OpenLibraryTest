//
//  BookDetailsCoordinator.swift
//  OpenLibraryTest
//
//  Created by Lobster on 16.04.23.
//

import UIKit

final class BookDetailsCoordinator: Coordinator {
    
    private var rootNavigationController: UINavigationController
    private var rootCoordinator: BookDetailsRootCoordinatorProtocol
    
    var childCoordinators: [Coordinator] = []
    
    init(rootNavigationController: UINavigationController,
         rootCoordinator: BookDetailsRootCoordinatorProtocol) {
        self.rootNavigationController = rootNavigationController
        self.rootCoordinator = rootCoordinator
    }
    
    func start() {
        assert(false, "Should be open with login, please use start(delegate:)")
    }
    
    func start(book: Book) {
        let rootViewController = BookDetailsAssembler.makeBookDetailsVC(coordinator: self,
                                                                        book: book)
        rootNavigationController.pushViewController(rootViewController, animated: true)
    }
    
    func finish() {
        rootNavigationController.popViewController(animated: true)
        rootCoordinator.bookDetailsSceneFinished(self)
    }
    
}

extension BookDetailsCoordinator: BookDetailsCoordinatorProtocol { }



