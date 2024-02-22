// ViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// ViewController - Лента для постов
final class ViewController: UIViewController {
    // MARK: Private Properties

    private let postTypes: [PostTypes] = [.stories, .firstPost, .recommendationPost, .otherPosts]
    private let storyViewCell = "StoryViewCell"
    private let recomendationViewCell = "RecomendationViewCell"
    private let otherViewCell = "OtherViewCell"
    private let firstViewCell = "FirstViewCell"
    private let logoTitle = "RMLink"
    private let logoFont = "Dancing Script"
    private let message = "message"
    // Контроллер реализован в TableView

    private let tableView = UITableView()

    // для работы с моделем делаю экземпляр

    private let source = Source()

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    // Функция для визуала

    private func setupUI() {
        view.backgroundColor = .white
        createHeaderButton()
        configuraTableView()
    }

    // Функция для конфигурации таблицу
    private func configuraTableView() {
        // Регистрирую все ячейки
        tableView.register(StoryViewCell.self, forCellReuseIdentifier: storyViewCell)
        tableView.register(RecomendationViewCell.self, forCellReuseIdentifier: recomendationViewCell)
        tableView.register(OtherViewCell.self, forCellReuseIdentifier: otherViewCell)
        tableView.register(FirstViewCell.self, forCellReuseIdentifier: firstViewCell)
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
        logoLabel.text = logoTitle
        logoLabel.font = UIFont(name: logoFont, size: 22)
        logoLabel.sizeToFit()

        let leftBarButton = UIBarButtonItem(customView: logoLabel)

        /// Кнопка сообщение верху
        let imageButton = UIButton()
        let image = UIImage(named: message)
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
    /// Типы постов
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
        postTypes.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch postTypes[section] {
        case .stories, .firstPost, .recommendationPost:
            return 1
        case .otherPosts:
            return source.otherPosts.count
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch postTypes[indexPath.section] {
        case .stories:
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: storyViewCell,
                for: indexPath
            ) as? StoryViewCell
            else { return UITableViewCell() }
            let post = source.story
            cell.setup(with: post)
            return cell
        case .firstPost:
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: firstViewCell,
                for: indexPath
            ) as? FirstViewCell
            else { return UITableViewCell() }
            let post = source.firstPost
            cell.setup(with: post)
            return cell
        case .recommendationPost:
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: recomendationViewCell,
                for: indexPath
            ) as? RecomendationViewCell
            else { return UITableViewCell() }
            let post = source.recommendation
            cell.setup(with: post)
            return cell
        case .otherPosts:
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: otherViewCell,
                for: indexPath
            ) as? OtherViewCell
            else { return UITableViewCell() }
            let post = source.otherPosts
            cell.setup(with: post)
            return cell
        }
    }
}
