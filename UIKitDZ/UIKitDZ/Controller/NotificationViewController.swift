// NotificationViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// NotificationViewController - страница уведомлении
final class NotificationViewController: UIViewController {
    // MARK: - Constants
    private enum Constants {
        static let standartFont = "Verdana"
        static let standartBoldFont = "Verdana-Bold"
        static let today = "Сегодня"
        static let thisWeek = "На этой неделе"
        static let notification = "Уведомления"
        static let notificationCell = "NotificationViewCell"
        
        static var contacts = Source.makeContactsWithGroup()
    }

    // MARK: - Visual Components

    private let tableView = UITableView()

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    // MARK: - Private Methods
    private func setupUI() {
        setupNavigationItem()
        setupTableView()
    }

    private func setupNavigationItem() {
        view.backgroundColor = .white
        navigationItem.title = Constants.notification
        navigationController?.navigationBar.prefersLargeTitles = true
        if let font = UIFont(name: Constants.standartBoldFont, size: 24) {
            navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.font: font]
        }
        /// еще один вариант let attributes = [NSAttributedString.Key.font: UIFont(name: "HelveticaNeue-Light", size:
        /// 17)!]
        /// UINavigationBar.appearance().titleTextAttributes = attributes
    }

    private func setupTableView() {
        view.addSubview(tableView)
        // Регистрируем ячейки
        tableView.register(NotificationViewCell.self, forCellReuseIdentifier: Constants.notificationCell)
        tableView.dataSource = self
        tableView.delegate = self

        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 150
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
}

// MARK: Делагаты таблицы

extension NotificationViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }

    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
}

// MARK: Датасоурс таблицы

extension NotificationViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            Constants.today
        case 1:
            Constants.thisWeek
        default:
            nil
        }
    }

    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        guard let header = view as? UITableViewHeaderFooterView else { return }
        header.textLabel?.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        header.textLabel?.textColor = .black
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        Constants.contacts[section].count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.notificationCell, for: indexPath) as?
            NotificationViewCell else { return UITableViewCell() }

        cell.configure(with: Constants.contacts[indexPath.section][indexPath.row])
        return cell
    }

    func tableView(
        _ tableView: UITableView,
        commit editingStyle: UITableViewCell.EditingStyle,
        forRowAt indexPath: IndexPath
    ) {
        if editingStyle == .delete {
            Constants.contacts[indexPath.section].remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .left)
        }
    }
}
