// SceneDelegate.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Documantation for SceneDelegate виндоус с навигацей
final class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {
        makeWindow(with: scene)
    }

    private func makeWindow(with scene: UIScene) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        let navigationController = UINavigationController(rootViewController: MainViewController())
        window?.rootViewController = navigationController
        window?.backgroundColor = .white
        window?.makeKeyAndVisible()
    }
}
