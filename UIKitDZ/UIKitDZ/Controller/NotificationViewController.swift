// NotificationViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// NotificationViewController - страница уведомлении
final class NotificationViewController: UIViewController {
    // MARK: Реализация тейблвью

    let tableView: UITableView = .init()

    var contacts = Source.makeContactsWithGroup()

    override func viewDidLoad() {
        super.viewDidLoad()

        // MARK: Настройка фона

        view.backgroundColor = .white
        navigationItem.title = "Уведомления"
        navigationController?.navigationBar.prefersLargeTitles = true
        if let font = UIFont(name: "Verdana-Bold", size: 24) {
            navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.font: font]
        }
        /// еще один вариант let attributes = [NSAttributedString.Key.font: UIFont(name: "HelveticaNeue-Light", size:
        /// 17)!]
        /// UINavigationBar.appearance().titleTextAttributes = attributes

        setupTableView()

        // MARK: Регистрируем ячейки

        tableView.register(NotificationViewCell.self, forCellReuseIdentifier: "NotificationViewCell")
        tableView.dataSource = self
        tableView.delegate = self

        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 150
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
        case 0: return "Сегодня"
        case 1: return "На этой неделе"
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
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "NotificationViewCell", for: indexPath) as?
            NotificationViewCell else { fatalError() }

        cell.configure(contact: contacts[indexPath.section][indexPath.row])
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

// MARK: Установка таблицы в контроллер

extension NotificationViewController {
    func setupTableView() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
}
