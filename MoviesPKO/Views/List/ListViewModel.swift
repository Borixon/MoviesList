//
//  ListViewModel.swift
//  MoviesPKO
//
//  Created by Michał Krupa on 04/12/2023.
//

import Foundation

final class ListViewModel: ViewModelProtocol, ListDataSourceProtocol {
    
    typealias D = MovieListModel
    
    var appendElements: (()->())?
    
    var insertLoading: ((Bool)->())?
    var displayError: ((Error?, String?)->())?
    var numberOfItems: Int { items.count }
    
    private var page: Int32 = 1
    private var items: [MovieListModel] = [.mock()]
    private var pageSize: Int { 20 }
    
    func onStart() {
        guard items.isEmpty else { return }
        getItemsForCurrentPage()
    }
    
    func getItemsForCurrentPage() {
        insertLoading?(true)
        MoviesService().getList(page: page).done { [weak self] pageData in
            self?.items.append(contentsOf: pageData.results)
            self?.appendElements?()
            
        }.catch { [weak self] error in
            self?.displayError?(error, "Ooops! Some error")
            
        }.finally { [weak self] in
            self?.insertLoading?(false)
        }
    }
    
    func elementAt(_ index: Int) -> MovieListModel {
        items[index]
    }
}

protocol ListDataSourceProtocol {
    associatedtype D
    func elementAt(_ index: Int) -> D
}
