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
        /// Window
        window = UIWindow(windowScene: windowScene)

        window?.rootViewController = TabBarController()
        window?.backgroundColor = .white
        window?.makeKeyAndVisible()
    }
}
