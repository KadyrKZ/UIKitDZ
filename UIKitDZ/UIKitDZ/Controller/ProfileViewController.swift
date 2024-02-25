// ProfileViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// ProfileViewController - скора будет
final class ProfileViewController: UIViewController {
    private let standartFont = "Verdana"
    private let standartBoldFont = "Verdana-Bold"
    private let blockTypes: [BlockTypes] = [.profile, .myStory, .myPost]
    // для работы с моделем делаю экземпляр
    private let source = Source()
    private let tableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }

    private func setupUI() {
        tableView.separatorStyle = .none
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(ProfileViewCell.self, forCellReuseIdentifier: "ProfileViewCell")
        tableView.register(MyStoryViewCell.self, forCellReuseIdentifier: "MyStoryViewCell")
        tableView.register(MyPostViewCell.self, forCellReuseIdentifier: "MyPostViewCell")
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
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
