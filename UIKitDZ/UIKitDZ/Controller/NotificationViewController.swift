// NotificationViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// NotificationViewController - страница уведомлении
final class NotificationViewController: UIViewController {
    // MARK: - Private Properties

    private let standartFont = "Verdana"
    private let standartBoldFont = "Verdana-Bold"
    private let today = "Сегодня"
    private let thisWeek = "На этой неделе"
    private let notification = "Уведомления"
    private let notificationCell = "NotificationViewCell"
    private var contacts = Source.makeContactsWithGroup()

    // MARK: - Visual Components

    private let tableView: UITableView = .init()

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    private func setupUI() {
        setupNavigationItem()
        setupTableView()
    }

    private func setupNavigationItem() {
        view.backgroundColor = .white
        navigationItem.title = notification
        navigationController?.navigationBar.prefersLargeTitles = true
        if let font = UIFont(name: standartBoldFont, size: 24) {
            navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.font: font]
        }
        /// еще один вариант let attributes = [NSAttributedString.Key.font: UIFont(name: "HelveticaNeue-Light", size:
        /// 17)!]
        /// UINavigationBar.appearance().titleTextAttributes = attributes
    }

    private func setupTableView() {
        view.addSubview(tableView)
        // Регистрируем ячейки
        tableView.register(NotificationViewCell.self, forCellReuseIdentifier: notificationCell)
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
        case 0: return today
        case 1: return thisWeek
        default:
            return nil
        }
    }

    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        guard let header = view as? UITableViewHeaderFooterView else { return }
        header.textLabel?.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        header.textLabel?.textColor = .black
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        contacts[section].count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: notificationCell, for: indexPath) as?
            NotificationViewCell else { return UITableViewCell() }

        cell.configure(with: contacts[indexPath.section][indexPath.row])
        return cell
    }

    func tableView(
        _ tableView: UITableView,
        commit editingStyle: UITableViewCell.EditingStyle,
        forRowAt indexPath: IndexPath
    ) {
        if editingStyle == .delete {
            contacts[indexPath.section].remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .left)
        }
    }
}
