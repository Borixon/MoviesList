//
//  HTTPResponse.swift
//  MoviesPKO
//
//  Created by Michał Krupa on 04/12/2023.
//

import Foundation

enum HttpResponse {
    
    case info
    case success
    case redirects
    case clientError
    case serverError
    
    init?(statusCode: Int) {
        if (100...199).contains(statusCode) {
            self = .info
        } else if (200...299).contains(statusCode) {
            self = .success
        } else if (300...399).contains(statusCode) {
            self = .redirects
        } else if (400...499).contains(statusCode) {
            self = .clientError
        } else if (500...599).contains(statusCode) {
            self = .serverError
        } else {
            return nil
        }
    }
}
