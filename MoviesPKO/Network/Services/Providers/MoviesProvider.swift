//
//  MoviesProvider.swift
//  MoviesPKO
//
//  Created by Michał Krupa on 04/12/2023.
//

import Moya
import Foundation

enum MoviesProvider {
    case nowPlaying(_ params: [String:Any]),
         getDetails(_ id: Int32)
}

extension MoviesProvider: TargetType {
    var baseURL: URL {
        URL(string: API.url)!
    }
    
    var path: String {
        switch self {
        case .nowPlaying(let _):
            return "3/discover/movie"
        case .getDetails(let id):
            return ""
        }
    }
    
    var method: Moya.Method {
        .get
    }
    
    var task: Moya.Task {
        switch self {
        case .nowPlaying(let params):
            return .requestParameters(parameters: params, encoding: URLEncoding.queryString)
        case .getDetails(let _):
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        Headers.standard
    }
}
