// ViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// ViewController - Лента для постов
final class ViewController: UIViewController {
    // MARK: Private Properties
    private enum Constants {
        static let postTypes: [PostTypes] = [.stories, .firstPost, .recommendationPost, .otherPosts]
        static let storyViewCell = "StoryViewCell"
        static let recomendationViewCell = "RecomendationViewCell"
        static let otherViewCell = "OtherViewCell"
        static let firstViewCell = "FirstViewCell"
        static let logoTitle = "RMLink"
        static let logoFont = "Dancing Script"
        static let message = "message"
    }
    // MARK: - Visual Components
    private let tableView = UITableView()

    private let source = Source()

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    // MARK: - Visual Components
    private func setupUI() {
        view.backgroundColor = .white
        createHeaderButton()
        configuraTableView()
    }

    // Функция для конфигурации таблицу
    private func configuraTableView() {
        // Регистрирую все ячейки
        tableView.register(StoryViewCell.self, forCellReuseIdentifier: Constants.storyViewCell)
        tableView.register(RecomendationViewCell.self, forCellReuseIdentifier: Constants.recomendationViewCell)
        tableView.register(OtherViewCell.self, forCellReuseIdentifier: Constants.otherViewCell)
        tableView.register(FirstViewCell.self, forCellReuseIdentifier: Constants.firstViewCell)
        // Подключаю делегат и датасорс для работы с таблицой
        tableView.dataSource = self
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false

        // Констрейнты для полного покрытие экрана тейблвью

        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
        ])
    }

    // Функция для создание хедера
    private func createHeaderButton() {
        /// Логотип приложения с кастомным шрифтом
        let logoLabel = UILabel()
        logoLabel.text = Constants.logoTitle
        logoLabel.font = UIFont(name: Constants.logoFont, size: 22)
        logoLabel.sizeToFit()

        let leftBarButton = UIBarButtonItem(customView: logoLabel)

        /// Кнопка сообщение верху
        let imageButton = UIButton()
        let image = UIImage(named: Constants.message)
        imageButton.setImage(image, for: .normal)
        imageButton.tintColor = .black
        imageButton.widthAnchor.constraint(equalToConstant: 18).isActive = true
        imageButton.heightAnchor.constraint(equalToConstant: 18).isActive = true
        navigationItem.leftBarButtonItem = leftBarButton
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: imageButton)
    }
}

// MARK: Расширение ViewController

extension ViewController {
    // MARK: - Types
    enum PostTypes {
        /// Истории
        case stories
        /// Первый пост
        case firstPost
        /// Рекоммендованные посты
        case recommendationPost
        /// Другие посты
        case otherPosts
    }
}

// MARK: Расширение для реализации методов UITableViewDataSource

extension ViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        Constants.postTypes.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch Constants.postTypes[section] {
        case .stories, .firstPost, .recommendationPost:
            1
        case .otherPosts:
            source.otherPosts.count
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch Constants.postTypes[indexPath.section] {
        case .stories:
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: Constants.storyViewCell,
                for: indexPath
            ) as? StoryViewCell
            else { return UITableViewCell() }
            cell.setup(with: source.story)
            return cell
        case .firstPost:
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: Constants.firstViewCell,
                for: indexPath
            ) as? FirstViewCell
            else { return UITableViewCell() }
            cell.setup(with: source.otherPosts[0])
            return cell
        case .recommendationPost:
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: Constants.recomendationViewCell,
                for: indexPath
            ) as? RecomendationViewCell
            else { return UITableViewCell() }
            cell.setup(with: source.recommendation)
            return cell
        case .otherPosts:
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: Constants.otherViewCell,
                for: indexPath
            ) as? OtherViewCell
            else { return UITableViewCell() }
            cell.setup(with: source.otherPosts)
            return cell
        }
    }
}
