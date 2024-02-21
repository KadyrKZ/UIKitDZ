// SceneDelegate.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// tabBarController
final class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {
        makeWindow(scene: scene)
    }

    private func makeWindow(scene: UIScene) {
        guard let windowScene = (scene as? UIWindowScene) else { return }

        window = UIWindow(windowScene: windowScene)
        window?.rootViewController = TabBarController()
        window?.backgroundColor = .white
        window?.makeKeyAndVisible()
    }
}
