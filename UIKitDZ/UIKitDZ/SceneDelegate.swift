// SceneDelegate.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// tabBarController
class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)

        let tabBarController = UITabBarController()

        let viewController1 = ViewController()
        let viewController2 = NotificationViewController()
        let viewController3 = ProfileViewController()

        viewController1.title = "Лента"
        viewController2.title = "Уведомления"
        viewController3.title = "Профиль"

        viewController1.tabBarItem.image = .feed
        viewController2.tabBarItem.image = .notification
        viewController3.tabBarItem.image = .profile

        let navController1 = UINavigationController(rootViewController: viewController1)
        let navController2 = UINavigationController(rootViewController: viewController2)
        let navController3 = UINavigationController(rootViewController: viewController3)

        tabBarController.setViewControllers([navController1, navController2, navController3], animated: false)

        window?.rootViewController = tabBarController
        window?.makeKeyAndVisible()
    }
}
