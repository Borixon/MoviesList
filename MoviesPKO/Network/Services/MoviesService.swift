//
//  MoviesService.swift
//  MoviesPKO
//
//  Created by Michał Krupa on 04/12/2023.
//

import PromiseKit

struct MoviesService {
    
    typealias T = MoviesProvider
    
    func getList(
        page: Int32 = 1,
        adult: Bool = true,
        video: Bool = false) -> Promise<NowPlayingListPage> {
            
            let params: [String:Any] =
            ["include_adult":adult,
             "include_video":video,
             "page":page,
             "sort_by":"popularity.desc",
             "with_release_type":2|3]
            
            return NetworkService()
                .request(target: T.nowPlaying(params))
        }
    
    func getDetails(
        id: Int64) -> Promise<MovieListModel> {
            NetworkService()
                .request(target: T.getDetails(id))
        }
}

