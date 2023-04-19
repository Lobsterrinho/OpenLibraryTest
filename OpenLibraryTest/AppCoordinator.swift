//
//  AppCoordinator.swift
//  OpenLibraryTest
//
//  Created by Lobster on 13.04.23.
//

import Foundation
import UIKit

final class AppCoordinator: Coordinator {
    
    private var windowScene: UIWindowScene
    private var window: UIWindow?
    
    var childCoordinators: [Coordinator] = []
    
    init (windowScene: UIWindowScene) {
        self.windowScene = windowScene
    }
    
    func start() {
        openBooksListScene()
        window?.makeKeyAndVisible()
    }
    
    func finish() {
        
    }
    
    private func openBooksListScene() {
        let booksWindow = UIWindow(windowScene: windowScene)
        let navigationController = UINavigationController()
        booksWindow.rootViewController = navigationController
        navigationController.navigationBar.prefersLargeTitles = true
        let booksListCoordinator = BooksListCoordinator(
            rootNavigationController: navigationController,
            rootCoordinator: self)
        childCoordinators.append(booksListCoordinator)
        booksListCoordinator.start()
        
        window = booksWindow
    }
}


extension AppCoordinator: BooksListRootCoordinatorProtocol {
    
    func booksListSceneFinished(_ coordinator: Coordinator) {
        childCoordinators.removeAll(where: { $0 === coordinator })
        start()
    }
}
