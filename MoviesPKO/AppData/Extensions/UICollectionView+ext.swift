//
//  UICollectionView+ext.swift
//  MoviesPKO
//
//  Created by Michał Krupa on 04/12/2023.
//

import UIKit

extension UICollectionView {
    func register(_ cellClass: CellClassProtocol.Type) {
        register(
            cellClass.self,
            forCellWithReuseIdentifier: cellClass.identifier)
    }
}
