//
//  Headers.swift
//  MoviesPKO
//
//  Created by Michał Krupa on 04/12/2023.
//

import Foundation
import Alamofire

struct Headers {
    
    static var standard: [String : String]? {
        Dictionary(
            standardHeaders.compactMap({ $0.component }),
            uniquingKeysWith: { (first, last) in last })
    }
    
    static var AFStandard: HTTPHeaders {
        HTTPHeaders(standardHeaders.map { $0.afComponent })
    }
    
    private static var standardHeaders: [HeaderComponent] {
        [.json, .authorization]
    }
    
    private enum HeaderComponent {
        case json,
             authorization
        
        var component: (String , String) {
            switch self {
            case .json:
                return ("accept", "application/json")
            case .authorization:
                return ("Authorization", API.token)
            }
        }
        
        var afComponent: HTTPHeader {
            HTTPHeader(
                name: self.component.0,
                value: self.component.1)
        }
    }
}
 
