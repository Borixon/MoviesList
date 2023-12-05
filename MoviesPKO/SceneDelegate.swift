//
//  SceneDelegate.swift
//  MoviesPKO
//
//  Created by Michał Krupa on 04/12/2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var appCoordinator: MainCoordinator = .init()

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene: UIWindowScene = scene as? UIWindowScene else { return }

        window = UIWindow(windowScene: windowScene)
        window?.rootViewController = appCoordinator.root
        
        appCoordinator.start()
        window?.makeKeyAndVisible()
    }
}

