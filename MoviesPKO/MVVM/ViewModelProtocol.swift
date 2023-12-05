//
//  ViewModelProtocol.swift
//  MoviesPKO
//
//  Created by Michał Krupa on 04/12/2023.
//

import Foundation

protocol ViewModelProtocol {
    
    var insertLoading: ((Bool)->())? { get set }
    var displayError: ((Error?, String?)->())? { get set }
    
    func onStart()
}
