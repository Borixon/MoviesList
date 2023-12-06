//
//  MoviesListLayout.swift
//  MoviesPKO
//
//  Created by Michał Krupa on 05/12/2023.
//

import UIKit

final class MoviesListLayout: UICollectionViewFlowLayout {
    
    private var cachedAttirbutes: [UICollectionViewLayoutAttributes] = []
    private var contentHeight: CGFloat = 0
    private var contentWidth: CGFloat { UIScreen.main.bounds.width }
    private let contentPadding: CGFloat = 20
    private let cellPadding: CGFloat = 16
    private var sectionOffset: CGFloat = 0
    private let numOfColumns: CGFloat = 2
    private let aspectTall: CGFloat = 1.60625
    private let aspectSmall: CGFloat = 1.40625
    
    override func prepare() {
        guard let collectionView = collectionView
              //,shouldPrepare(numberOfSections: collectionView.numberOfSections)
        else { return }
        
        contentHeight = 0
        cachedAttirbutes.removeAll()
        let section = 0
        let numOfElements = collectionView.numberOfItems(inSection: section)
        let colWidth = (contentWidth - 2 * contentPadding - cellPadding) / numOfColumns
        
        var xOffset: [CGFloat] = []
        for column in 0..<Int(numOfColumns) {
            let rest = column % Int(numOfColumns)
            xOffset.append(contentPadding + (colWidth + cellPadding) * CGFloat(rest))
        }
        
        var column = 0
        var yOffset: [CGFloat] = .init(repeating: sectionOffset, count: numOfElements)
        
        for item in 0..<numOfElements {
            
            let indexPath = IndexPath(item: item, section: section)
            let cellHeight: CGFloat = (indexPath.row == 0) ? (colWidth * aspectTall) : (colWidth * aspectSmall)
            
            if item < Int(numOfColumns) {
                yOffset[item] = yOffset[item]
                
            } else if item == numOfElements - 1 && item % 2 == 0 {
                column = 1
                yOffset[item] = yOffset[item - 1] + colWidth * aspectSmall + cellPadding
                
            } else {
                let prevCellHeight: CGFloat = ((indexPath.row - Int(numOfColumns)) == 0) ? (colWidth * aspectTall) : (colWidth * aspectSmall)
                yOffset[item] = yOffset[item - Int(numOfColumns)] + prevCellHeight + cellPadding
            }
            
            let frame = CGRect(x: xOffset[column], y: yOffset[item], width: colWidth, height: cellHeight)
            let attributes = UICollectionViewLayoutAttributes(forCellWith: indexPath)
            attributes.frame = frame
            cachedAttirbutes.append(attributes)
            contentHeight = max(contentHeight, max(collectionView.bounds.height, frame.maxY))
            
            column = column == 0 ? 1 : 0
        }
    }
}
