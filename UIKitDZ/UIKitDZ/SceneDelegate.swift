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

        vc1.tabBarItem = UITabBarItem(title: "Каталог", image: .catalog, tag: 0)
        vc1.tabBarItem.imageInsets = UIEdgeInsets(top: 6, left: 2, bottom: 6, right: 2) // Уменьшаем размер изображения
        vc1.tabBarItem.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: 0) // Поднимаем текст

        vc2.tabBarItem = UITabBarItem(title: "Корзина", image: .cart, tag: 1)
        vc2.tabBarItem.imageInsets = UIEdgeInsets(top: 6, left: 2, bottom: 6, right: 2)
        vc2.tabBarItem.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: 0)

        profileNavigationController.tabBarItem = UITabBarItem(title: "Профиль", image: .profile, tag: 2)
        profileNavigationController.tabBarItem.imageInsets = UIEdgeInsets(top: 4, left: 2, bottom: 4, right: 2)
        profileNavigationController.tabBarItem.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: 0)

        let tabBarController = UITabBarController()
        tabBarController.viewControllers = [vc1, vc2, profileNavigationController]
        tabBarController.selectedViewController = vc1

        window.rootViewController = tabBarController
        window.tintColor = .systemPink
        window.backgroundColor = .white
        window.makeKeyAndVisible()

        self.window = window
    }
}
