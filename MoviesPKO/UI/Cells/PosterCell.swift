//
//  PosterCell.swift
//  MoviesPKO
//
//  Created by Michał Krupa on 04/12/2023.
//

import UIKit
import SDWebImage

final class PosterCell: UICollectionViewCell, CellClassProtocol {
    
    private let container = UIView()
    private let poster = UIImageView()
    private let title = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(_ item: MovieListModel) {
        title.text = item.title
        poster.sd_setImage(
            with: URL(string: API.imageBaseUrl + item.poster))
    }
    
    private func setupView() {
        contentView.addSubview(container)
        container.backgroundColor = Colors.cellBg
        container.layer.cornerRadius = Corners.small
        container.layer.shadowOpacity = 1
        container.layer.shadowColor = Colors.shadow.cgColor
        container.layer.shadowRadius = Corners.small
        container.layer.shadowOffset = .init(width: 8, height: 8)
        container.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(8)
        }
        
        container.addSubview(title)
        title.font = Fonts.get(size: 18, weight: .bold)
        title.numberOfLines = 0
        title.textAlignment = .center
        title.textColor = Colors.text
        title.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.bottom.equalToSuperview().inset(8)
        }
        
        container.addSubview(poster)
        poster.contentMode = .scaleAspectFill
        poster.backgroundColor = UIColor(white: 0, alpha: 0.1)
        poster.layer.masksToBounds = true
        poster.layer.cornerRadius = Corners.small
        poster.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        poster.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.bottom.equalTo(title.snp.top).offset(-8)
        }
    }
}
