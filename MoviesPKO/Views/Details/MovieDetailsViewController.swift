//
//  MovieDetailsViewController.swift
//  MoviesPKO
//
//  Created by Michał Krupa on 05/12/2023.
//

import UIKit

final class MovieDetailsViewController: UIViewController {
    
    private let viewModel: MovieDetailsViewModel
    
    var coordinator: MainCoordinator?
    
    init(id: Int64) {
        viewModel = .init(id: id)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private var scrollView: UIScrollView = {
        let scroll = UIScrollView(frame: .zero)
        scroll.isUserInteractionEnabled = true
        return scroll
    }()
    
    private var contentView: UIStackView = {
        let stack = UIStackView(frame: .zero)
        stack.spacing = 20
        stack.isLayoutMarginsRelativeArrangement = true
        stack.layoutMargins = .init(top: 0, left: 16, bottom: 0, right: 16)
        stack.alignment = .fill
        stack.distribution = .equalSpacing
        stack.axis = .vertical
        return stack
    }()
    
    private lazy var closeButton: UIButton = {
        let btn = getButton(icon: viewModel.closeIcon)
        btn.tintColor = Colors.text
        return btn
    }()
    
    private lazy var favoriteButton: UIButton = {
        let btn = getButton(icon: viewModel.favoriteIcon())
        btn.tintColor = viewModel.favoriteTint()
        return btn
    }()
    
    private func getButton(icon: UIImage?) -> UIButton {
        let button = UIButton(frame: .zero)
        button.setImage(
            icon,
            for: .normal)
        button.addTarget(
            self,
            action: #selector(cta(_:)),
            for: .touchUpInside)
        button.snp.makeConstraints {
            $0.width.height.equalTo(40)
        }
        return button
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubviews()
        setupViewModel()
    }
    
    private func setupViewModel() {
        viewModel.propagateSubviews = { [weak self] subviews in
            self?.contentView.addSubviews(subviews)
        }
        viewModel.updateFavIcon = { [weak self] icon, tint in
            self?.favoriteButton.setImage(icon, for: .normal)
            self?.favoriteButton.tintColor = tint
        }
        viewModel.onStart()
    }
    
    private func setupSubviews() {
        view.backgroundColor = Colors.background
        view.addSubview(scrollView)
        scrollView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        scrollView.addSubview(contentView)
        contentView.snp.makeConstraints {
            $0.edges.width.equalToSuperview()
        }
        
        view.addSubview(closeButton)
        closeButton.snp.makeConstraints {
            $0.top.leading.equalToSuperview().inset(16)
        }
        
        view.addSubview(favoriteButton)
        favoriteButton.snp.makeConstraints {
            $0.top.trailing.equalToSuperview().inset(16)
        }
    }
    
    @objc func cta(_ sender: UIButton) {
        if sender === closeButton {
            dismiss(animated: true)
            
        } else if sender === favoriteButton {
            viewModel.didPressFavorite()
        }
    }
}
