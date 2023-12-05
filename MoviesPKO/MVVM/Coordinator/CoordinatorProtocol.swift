//
//  CoordinatorProtocol.swift
//  MoviesPKO
//
//  Created by Michał Krupa on 04/12/2023.
//

import UIKit

protocol CoordinatorProtocol {
    var root: UINavigationController { get set }
    
    func start()
}
