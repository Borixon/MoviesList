//
//  NowPlayingElement.swift
//  MoviesPKO
//
//  Created by Michał Krupa on 04/12/2023.
//

import Foundation

struct MovieListModel: Codable {
    
    let id: Int64
    let adult: Bool
    let title: String
    let overview: String
    let backdrop: String
    let poster: String
    let rating: Double

    enum CodingKeys: String, CodingKey {
        case id
        case adult
        case title
        case overview
        case backdrop = "backdrop_path"
        case poster = "poster_path"
        case rating = "vote_average"
    }
    
    static func mock() -> MovieListModel {
        .init(id: 0,
              adult: false,
              title: "Mock",
              overview: "",
              backdrop: "/f1AQhx6ZfGhPZFTVKgxG91PhEYc.jpg",
              poster: "/hkxxMIGaiCTmrEArK7J56JTKUlB.jpg",
              rating: 6.9)
    }
}
