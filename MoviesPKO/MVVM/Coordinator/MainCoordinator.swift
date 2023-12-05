//
//  Coordinator.swift
//  MoviesPKO
//
//  Created by Michał Krupa on 04/12/2023.
//

import UIKit

final class MainCoordinator: CoordinatorProtocol {
    
    var root: UINavigationController
    
    init() {
        root = .init()
    }
    
    func start() {
        let vc = ListViewController()
        vc.coordinator = self
        root.viewControllers = [vc]
    }
}
