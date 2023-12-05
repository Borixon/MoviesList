//
//  NowPlayingElement.swift
//  MoviesPKO
//
//  Created by Michał Krupa on 04/12/2023.
//

import Foundation

struct NowPlayingElement: Codable {
    
    let id: Int64
    let adult: Bool
    let title: String
    let backdrop: String
    let poster: String
    let rating: Double

    enum CodingKeys: String, CodingKey {
        case id
        case adult
        case title
        case backdrop = "backdrop_path"
        case poster = "poster_path"
        case rating = "vote_average"
    }
    
}
