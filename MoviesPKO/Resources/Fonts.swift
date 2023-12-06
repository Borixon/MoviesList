//
//  Fonts.swift
//  MoviesPKO
//
//  Created by Michał Krupa on 05/12/2023.
//

import UIKit

struct Fonts {
    static func get(size: CGFloat = 18, weight: Weight) -> UIFont {
        UIFont(name: "Helvetica-\(weight.rawValue.capitalized)", size: size)!
    }
}

enum Weight: String {
    case light,
         regular,
         bold
}
