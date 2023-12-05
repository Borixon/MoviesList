//
//  Headers.swift
//  MoviesPKO
//
//  Created by Michał Krupa on 04/12/2023.
//

import Foundation

struct Headers {
    
    static var standard: [String : String]? {
        Dictionary(
            [HeaderComponent.json].compactMap({ $0.component }),
            uniquingKeysWith: { (first, last) in last })
    }
    
    private enum HeaderComponent {
        case json
        
        var component: (String , String) {
            switch self {
            case .json:
                return ("accept", "application/json")
            }
        }
    }
}
 
