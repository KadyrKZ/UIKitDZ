// TabBarController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// TabBarController - таббар для приложения
final class TabBarController: UITabBarController {
    // MARK: - Constants
    private enum Constants {
        static let feedTitle = "Лента"
        static let notification = "Уведомления"
        static let profile = "Профиль"
    }
    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabs()
    }

    // MARK: Private Methods

    private func setupTabs() {
        let feed = createNavigationController(with: Constants.feedTitle, and: .feed, viewController: ViewController())
        let notification = createNavigationController(
            with: Constants.notification,
            and: .notification,
            viewController: NotificationViewController()
        )
        let profile = createNavigationController(with: Constants.profile, and: .profile, viewController: ProfileViewController())
        setViewControllers([feed, notification, profile], animated: true)
    }

    private func createNavigationController(
        with title: String,
        and image: UIImage?,
        viewController: UIViewController
    ) -> UINavigationController {
        let navigationController = UINavigationController(rootViewController: viewController)
        let item = navigationController.tabBarItem
        item?.image = image
        item?.title = title
        item?.imageInsets = UIEdgeInsets(top: 6, left: 6, bottom: 6, right: 6)

        return navigationController
    }
}
