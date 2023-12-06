//
//  MovieDetailsViewModel.swift
//  MoviesPKO
//
//  Created by Michał Krupa on 05/12/2023.
//

import UIKit

class MovieDetailsViewModel: ViewModelProtocol {
    
    let id: Int64
    
    var insertLoading: ((Bool) -> ())?
    var updateFavIcon: ((UIImage?, UIColor) -> ())?
    var displayError: ((Error?, String?) -> ())?
    var propagateSubviews: (([UIView]) -> ())?
    
    let closeIcon = UIImage(systemName: "xmark.circle.fill")
    
    private var details: MovieListModel? {
        didSet {
            if let details = details {
                propagateSubviews?(
                    MovieDetailsContentBuilder.getViews(from: details))
            } else {
                displayError?(nil, "Oops!\nNo data found")
            }
        }
    }
    
    init(id: Int64) {
        self.id = id
    }
    
    func onStart() {
        insertLoading?(true)
        MoviesService().getDetails(id: id).done {
            self.details = $0
        }.catch { [weak self] in
            self?.displayError?($0, nil)
        }.finally { [weak self] in
            self?.insertLoading?(false)
        }
    }
    
    func favoriteTint() -> UIColor {
        AppData().isMovieFavorite(id) ? .yellow : .gray
    }
    
    func favoriteIcon() -> UIImage? {
        let fav = AppData().isMovieFavorite(id)
        let icon = UIImage(systemName: fav ? "star.fill" : "star")
        return icon?.withTintColor(
            favoriteTint(),
            renderingMode: .alwaysTemplate)
    }
    
    func didPressFavorite() {
        let appData = AppData()
        let isFav = appData.isMovieFavorite(id)
        appData.addToFavorite(!isFav, movieId: id)
        updateFavIcon?(favoriteIcon(), favoriteTint())
    }
}
