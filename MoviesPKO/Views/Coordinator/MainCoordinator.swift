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
        root.setNavigationBarHidden(true, animated: false)
    }
    
    func start() {
        let vc = ListViewController()
        vc.coordinator = self
        root.viewControllers = [vc]
    }
    
    func presentMovieDetails(item: MovieListModel) {
        let vc = MovieDetailsViewController(id: item.id)
        vc.coordinator = self
        root.present(vc, animated: true)
    }
}
