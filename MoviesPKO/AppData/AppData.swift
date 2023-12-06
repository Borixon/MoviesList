//
//  AppData.swift
//  MoviesPKO
//
//  Created by Michał Krupa on 06/12/2023.
//

import Foundation

struct AppData {
    
    internal let defaults: UserDefaults
    
    init(with defaults: UserDefaults = UserDefaults.standard) {
        self.defaults = defaults
    }
    
    private var favMovies: [Int64]? {
        if let list: [Int64] = get(.favoriteMovies) {
            return list
            
        } else {
            defaults.setValue(
                [Int64](),
                forKey: AppDataKey.favoriteMovies.rawValue)
            return []
        }
    }
    
    func get<T>(_ key: AppDataKey) -> T? {
        defaults.object(forKey: key.rawValue) as? T
    }
    
    func set(_ data: Any?, for key: AppDataKey) {
        defaults.setValue(data, forKey: key.rawValue)
    }

    func clearAppData() {
        AppDataKey.allCases.forEach {
            set(nil, for: $0)
        }
    }
    
    func isMovieFavorite(_ movieId: Int64) -> Bool {
        if let favMovies = favMovies {
            return favMovies.contains(movieId)
        } else {
            return false
        }
    }
    
    func addToFavorite(_ addToFav: Bool, movieId: Int64) {
        guard var currentIds = favMovies else {
            return
        }
        if addToFav {
            currentIds.append(movieId)
        } else {
            currentIds = currentIds.filter { $0 != movieId }
        }
        set(currentIds, for: .favoriteMovies)
    }
}
