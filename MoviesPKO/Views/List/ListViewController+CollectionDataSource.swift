//
//  ListViewController+CollectionDataSource.swift
//  MoviesPKO
//
//  Created by Michał Krupa on 04/12/2023.
//

import UIKit

extension ListViewController: UICollectionViewDataSource {
    
    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int) -> Int {
            viewModel.numberOfItems
        }
    
    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: PosterCell.identifier,
                for: indexPath) as! PosterCell
            cell.setup(
                viewModel.elementAt(indexPath.row))
              
            return cell
        }
    
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath) -> CGSize {
            let w = collectionView.bounds.width - 40
            return .init(width: w,
                         height: w * 1.25)
        }
}

extension ListViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        insetForSectionAt section: Int) -> UIEdgeInsets {
            .init(top: 0, left: 16, bottom: 0, right: 16)
        }
}
