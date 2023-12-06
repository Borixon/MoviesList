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
    private let indicator: UIActivityIndicatorView
    
    internal let viewModel: ListViewModel
    internal var coordinator: MainCoordinator? = nil
    
    init() {
        viewModel = .init()
        indicator = .init(style: .large)
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
        viewModel.displayError = { _, text in
            self.insertAlert(text)
        }
        viewModel.insertLoading = { [unowned self] insert in
            self.insetLoading(insert)
        }
        // TODO: Add index paths
        viewModel.appendElements = { [unowned self] in
            self.collectionView.reloadData()
            self.revealCollectionIfNeeded()
        }
        viewModel.onStart()
    }
    
    private func insetLoading(_ insert: Bool) {
        UIView.animate(withDuration: 0.3, animations: { [unowned self] in
            self.indicator.alpha = insert ? 1 : 0
        })
    }
    
    private func insertAlert(_ text: String?) {
        let alert = UIAlertController(
            title: "Oops!",
            message: text,
            preferredStyle: .actionSheet)
        alert.addAction(.init(
            title: "Ok",
            style: .default,
            handler: { _ in
                print("TODO: Handle action")
            }))
        present(alert, animated: true)
    }
    
    private func revealCollectionIfNeeded() {
        guard collectionView.alpha == 0 else { return }
        UIView.animate(withDuration: 0.3, animations: { [unowned self] in
            self.collectionView.alpha = 1
        })
    }
    
    private func setupViewComponents() {
        view.backgroundColor = Colors.background
        setupCollectionView()
        setupIndicator()
    }
    
    private func setupIndicator() {
        view.addSubview(indicator)
        indicator.color = Colors.shadow
        indicator.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.width.height.equalTo(44)
        }
        indicator.startAnimating()
    }
    
    private func setupCollectionView() {
        view.addSubview(collectionView)
        collectionView.alpha = 0
        collectionView.backgroundColor = .clear
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(PosterCell.self)
        collectionView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}
