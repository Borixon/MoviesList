//
//  NSError.swift
//  MoviesPKO
//
//  Created by Michał Krupa on 04/12/2023.
//

import Foundation

enum NSError: String, Error {
    case noService, 
         reject,
         dataNotAvailable
}
