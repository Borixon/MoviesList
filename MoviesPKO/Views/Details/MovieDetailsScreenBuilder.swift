//
//  MovieDetailsScreenBuilder.swift
//  MoviesPKO
//
//  Created by Michał Krupa on 05/12/2023.
//

import UIKit
import SDWebImage

struct MovieDetailsContentBuilder {
    
    static func getViews(from details: MovieListModel) -> [UIView] {
        [poster(details),
         label(text: details.overview, size: 16, alignment: .natural, fontWeight: .light)]
    }
    
    private static func poster(_ details: MovieListModel) -> UIImageView {
        let view = UIImageView()
        view.contentMode = .scaleAspectFill
        view.snp.makeConstraints {
            $0.height.equalTo(UIScreen.main.bounds.width * 1.23)
        }
        view.sd_setImage(
            with: URL(string: API.imageBaseUrl + details.backdrop))
        
        let title = label(text: details.title,
                          size: 42,
                          alignment: .center,
                          fontWeight: .bold)
        title.shadowColor = Colors.shadow
        title.shadowOffset = .init(width: 2, height: 2)
        view.addSubview(title)
        title.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.width.equalToSuperview().multipliedBy(0.75)
        }
        
        return view
    }
    
    private static func label(text: String,
                              size: CGFloat,
                              alignment: NSTextAlignment,
                              fontWeight: Weight) -> UILabel {
        let label = UILabel()
        label.numberOfLines = 0
        label.text = text
        label.textAlignment = alignment
        label.textColor = Colors.text
        label.font = Fonts.get(size: size, weight: fontWeight)
        label.contentScaleFactor = 0.5
        return label
    }
}
