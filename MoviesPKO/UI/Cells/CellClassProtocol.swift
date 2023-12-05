//
//  CellClassProtocol.swift
//  MoviesPKO
//
//  Created by Michał Krupa on 04/12/2023.
//

import UIKit

protocol CellClassProtocol: UICollectionViewCell {
    static var identifier: String { get }
}

extension CellClassProtocol {
    static var identifier: String {
        String(describing: self)
    }
}
