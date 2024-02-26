// ProfileViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// ProfileViewController - провиля узера
final class ProfileViewController: UIViewController {
    // MARK: - Private Properties

    private let standartFont = "Verdana"
    private let standartBoldFont = "Verdana-Bold"
    private let blockTypes: [BlockTypes] = [.profile, .myStory, .myPost]
    // для работы с моделем делаю экземпляр
    private let source = Source()
    private let tableView = UITableView()

    // MARK: - Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }

    // Установка визуала
    private func setupUI() {
        tableView.separatorStyle = .none
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(ProfileViewCell.self, forCellReuseIdentifier: "ProfileViewCell")
        tableView.register(MyStoryViewCell.self, forCellReuseIdentifier: "MyStoryViewCell")
        tableView.register(MyPostViewCell.self, forCellReuseIdentifier: "MyPostViewCell")
        view.addSubview(tableView)
        setupNavigationBar()
        tableView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
        ])
    }

    // Кривой навбар
    private func setupNavigationBar() {
        let navigationItem = UINavigationItem(title: "Profile")

        let leftImage = UIImage(named: "lock")?.withRenderingMode(.alwaysTemplate)
        let leftButton = UIButton(type: .custom)
        leftButton.setImage(leftImage, for: .normal)
        leftButton.tintColor = .black
        leftButton.imageView?.contentMode = .scaleAspectFit
        leftButton.frame = CGRect(x: 0, y: 0, width: 24, height: 24)
        let leftBarButtonItem = UIBarButtonItem(customView: leftButton)
        navigationItem.leftBarButtonItem = leftBarButtonItem

        let rightImage1 = UIImage(named: "addProfile")?.withRenderingMode(.alwaysTemplate)
        let rightImage2 = UIImage(named: "setting")?.withRenderingMode(.alwaysTemplate)
        let rightButton1 = UIButton(type: .custom)
        rightButton1.setImage(rightImage1, for: .normal)
        rightButton1.tintColor = .black
        rightButton1.imageView?.contentMode = .scaleAspectFit
        rightButton1.frame = CGRect(x: 0, y: 0, width: 24, height: 24)

        let rightButton2 = UIButton(type: .custom)
        rightButton2.setImage(rightImage2, for: .normal)
        rightButton2.tintColor = .black
        rightButton2.imageView?.contentMode = .scaleAspectFit
        rightButton2.frame = CGRect(x: 0, y: 0, width: 24, height: 24)

        let rightBarButtonItem1 = UIBarButtonItem(customView: rightButton1)
        let rightBarButtonItem2 = UIBarButtonItem(customView: rightButton2)
        navigationItem.rightBarButtonItems = [rightBarButtonItem1, rightBarButtonItem2]

        let navigationBar = UINavigationBar()
        navigationBar.backgroundColor = .white
        navigationBar.isTranslucent = false
        navigationBar.items = [navigationItem]
        navigationBar.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(navigationBar)

        NSLayoutConstraint.activate([
            navigationBar.topAnchor.constraint(equalTo: view.topAnchor, constant: 40),
            navigationBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            navigationBar.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
}

extension ProfileViewController {
    /// Типы блока
    enum BlockTypes {
        /// Профиль
        case profile
        /// Истории
        case myStory
        /// Посты
        case myPost
    }
}

extension ProfileViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        blockTypes.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch blockTypes[section] {
        case .profile:
            return 1
        case .myStory:
            return 1
        case .myPost:
            return 1
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch blockTypes[indexPath.section] {
        case .profile:
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: "ProfileViewCell",
                for: indexPath
            ) as? ProfileViewCell
            else { return UITableViewCell() }
            return cell
        case .myStory:
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: "MyStoryViewCell",
                for: indexPath
            ) as? MyStoryViewCell
            else { return UITableViewCell() }

            let post = source.story
            cell.setup(with: post)
            return cell
        case .myPost:
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: "MyPostViewCell",
                for: indexPath
            ) as? MyPostViewCell
            else { return UITableViewCell() }
            return cell
        }
    }
}

extension ProfileViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch blockTypes[indexPath.section] {
        case .profile:
            return UITableView.automaticDimension
        case .myStory:
            return UITableView.automaticDimension
        case .myPost:
            let totalHeightOfOtherSections = 310.0
            let remainingHeight = tableView.bounds.height - totalHeightOfOtherSections

            return remainingHeight
        }
    }
}
