//
//  AlertControllerFactoryProtocol.swift
//  OpenLibraryTest
//
//  Created by Lobster on 20.04.23.
//

import Foundation
import UIKit

protocol AlertControllerFactoryProtocol {
    
    func makeAlert(title: String?,
                   message: String?,
                   actions: [AlertControllerFactory.AlertAction]) -> UIAlertController
    
    func makeActionSheet(title: String?,
                         message: String?,
                         actions: [AlertControllerFactory.AlertAction]) -> UIAlertController
    
    
    
}

extension AlertControllerFactoryProtocol {
    
    func makeAlert(title: String? = nil,
                   message: String? = nil,
                   actions: [AlertControllerFactory.AlertAction]) -> UIAlertController {
        self.makeAlert(title: title, message: message, actions: actions)
    }
    
    func makeActionSheet(title: String? = nil,
                         message: String? = nil,
                         actions: [AlertControllerFactory.AlertAction]) -> UIAlertController {
        self.makeActionSheet(title: title, message: message, actions: actions)
    }
}
