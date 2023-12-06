//
//  UIStackView+ext.swift
//  MoviesPKO
//
//  Created by Michał Krupa on 06/12/2023.
//

import UIKit

extension UIStackView {
    func addSubviews(_ views: [UIView]) {
        views.forEach { self.addArrangedSubview($0) }
    }
}
