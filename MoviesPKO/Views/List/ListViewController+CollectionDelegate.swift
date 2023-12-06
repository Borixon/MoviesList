//
//  ListViewController+CollectionDelegate.swift
//  MoviesPKO
//
//  Created by Michał Krupa on 04/12/2023.
//

import UIKit

extension ListViewController: UICollectionViewDelegate {
    func collectionView(
        _ collectionView: UICollectionView,
        didSelectItemAt indexPath: IndexPath) {
        
            coordinator?.presentMovieDetails(item: viewModel.elementAt(indexPath.row))
        }
}
