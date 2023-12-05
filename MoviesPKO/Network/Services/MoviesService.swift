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
             "with_release_type":2|3,
             "api_key":API.apiKey]
        
        return NetworkService()
                .request(target: T.nowPlaying(params))
    }
    
    func getDetails(
        id: Int32) -> Promise<[String]> {
        return Promise<[String]> {
            $0.fulfill([""])
        }
    }
}
