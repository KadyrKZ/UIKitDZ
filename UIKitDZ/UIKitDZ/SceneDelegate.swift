// SceneDelegate.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Documantation for SceneDelegate
class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)

        let vc1 = ViewController()
        let vc2 = CartViewController()
        let vc3 = ProfileViewController()

        let profileNavigationController = UINavigationController(rootViewController: vc3)

        vc1.tabBarItem = UITabBarItem(title: "", image: .catalog, tag: 0)
        vc2.tabBarItem = UITabBarItem(title: "", image: .cart, tag: 1)
        profileNavigationController.tabBarItem = UITabBarItem(title: "", image: .profile, tag: 2)

        let tabBarController = UITabBarController()
        tabBarController.viewControllers = [vc1, vc2, profileNavigationController]
        tabBarController.selectedViewController = vc1

        window.rootViewController = tabBarController
        window.backgroundColor = .white
        window.makeKeyAndVisible()

        self.window = window
    }
}
