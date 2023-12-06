//
//  ListVC.swift
//  MoviesPKO
//
//  Created by Michał Krupa on 04/12/2023.
//

import UIKit
import SnapKit

final class ListViewController: UIViewController {
    
    private let collectionView: UICollectionView
    
    internal let viewModel: ListViewModel
    internal var coordinator: MainCoordinator? = nil
    
    init() {
        viewModel = .init()
        collectionView = .init(
            frame: .zero,
            collectionViewLayout: MoviesListLayout())
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewModel()
        setupViewComponents()
    }
    
    private func setupViewModel() {
        viewModel.displayError = { _, _ in
            
        }
        viewModel.insertLoading = { _ in
            
        }
        viewModel.appendElements = {
            self.collectionView.reloadData()
        }
        viewModel.onStart()
    }
    
    private func setupViewComponents() {
        view.backgroundColor = Colors.background
        setupCollectionView()
    }
    
    private func setupCollectionView() {
        view.addSubview(collectionView)
        
        collectionView.backgroundColor = .clear
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(PosterCell.self)
        collectionView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}
