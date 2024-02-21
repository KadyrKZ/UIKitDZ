// TabBarController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// TabBarController - таббар для приложения
class TabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabs()
    }

    // MARK: Private Methods

    private func setupTabs() {
        let feed = createNavigation(with: "Лента", and: .feed, viewController: ViewController())
        let notification = createNavigation(
            with: "Уведомления",
            and: .notification,
            viewController: NotificationViewController()
        )
        let profile = createNavigation(with: "Профиль", and: .profile, viewController: ProfileViewController())
        setViewControllers([feed, notification, profile], animated: true)
    }

    private func createNavigation(
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
