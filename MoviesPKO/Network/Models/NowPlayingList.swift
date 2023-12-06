//
//  NowPlayingList.swift
//  MoviesPKO
//
//  Created by Michał Krupa on 04/12/2023.
//

import Foundation

struct NowPlayingListPage: Codable {
    let page: Int
    let results: [MovieListModel]
    let total_pages: Int64
    let total_results: Int64
}
