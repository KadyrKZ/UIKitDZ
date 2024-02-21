// ViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// ViewController - Лента для постов
final class ViewController: UIViewController {
    // MARK: Private Properties

    // MARK: Массив для типов постов

    private let postTypes: [PostTypes] = [.stories, .firstPost, .recommendPost, .otherPosts]

    // MARK: Контроллер реализован в TableView

    private let tableView = UITableView()

    // MARK: для работы с моделем делаю экземпляр

    private let source = Source()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
    }

    // MARK: Функция для визуала

    private func setupUI() {
        createHeaderButton()
        configuraTableView()
    }

    // MARK: Функция для конфигурации таблицу

    private func configuraTableView() {
        // Регистрирую все ячейки
        tableView.register(StoryViewCell.self, forCellReuseIdentifier: "StoryViewCell")
        tableView.register(RecomendViewCell.self, forCellReuseIdentifier: "RecomendViewCell")
        tableView.register(OtherViewCell.self, forCellReuseIdentifier: "OtherViewCell")
        tableView.register(FirstViewCell.self, forCellReuseIdentifier: "FirstViewCell")
        // Подключаю делегат и датасорс для работы с таблицой
        tableView.dataSource = self
        tableView.delegate = self
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false

        // MARK: Констрейнты для полного покрытие экрана тейблвью

        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),

        ])
    }

    // MARK: Функция для создание хедера

    fileprivate func createHeaderButton() {
        /// Логотип приложения с кастомным шрифтом
        let logoLabel = UILabel()
        logoLabel.text = "RMLink"
        logoLabel.font = UIFont(name: "Dancing Script", size: 22)
        logoLabel.sizeToFit()

        let leftBarButton = UIBarButtonItem(customView: logoLabel)

        /// Кнопка сообщение верху
        let imageButton = UIButton()
        let image = UIImage(named: "message")
        imageButton.setImage(image, for: .normal)
        imageButton.tintColor = .black
        imageButton.widthAnchor.constraint(equalToConstant: 18).isActive = true
        imageButton.heightAnchor.constraint(equalToConstant: 18).isActive = true
        navigationItem.leftBarButtonItem = leftBarButton
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: imageButton)
    }

    @objc func imageButtonTapped() {
        print("Скоро")
    }
}

// MARK: Расширение ViewController

extension ViewController {
    /// Типы постов
    enum PostTypes {
        case stories
        case firstPost
        case recommendPost
        case otherPosts
    }
}

// MARK: Расширение для реализации UITableViewDataSource

extension ViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        postTypes.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch postTypes[section] {
        case .stories, .firstPost, .recommendPost:
            return 1
        case .otherPosts:
            return source.posts.count
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch postTypes[indexPath.section] {
        case .stories:
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: "StoryViewCell",
                for: indexPath
            ) as? StoryViewCell
            else { return UITableViewCell() }
            let post = source.story
            cell.setupCell(posts: post)
            return cell
        case .firstPost:
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: "FirstViewCell",
                for: indexPath
            ) as? FirstViewCell
            else { return UITableViewCell() }
            let post = source.firstPost
            cell.setupCell(post: post)
            return cell
        case .recommendPost:
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: "RecomendViewCell",
                for: indexPath
            ) as? RecomendViewCell
            else { return UITableViewCell() }
            let post = source.recommend
            cell.setupCell(posts: post)
            return cell
        case .otherPosts:
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: "OtherViewCell",
                for: indexPath
            ) as? OtherViewCell
            else { return UITableViewCell() }
            let post = source.otherPosts
            cell.setupCell(post: post)
            return cell
        }
    }
}

extension ViewController: UITableViewDelegate {}
