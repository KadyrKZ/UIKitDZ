// ReminderViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// ReminderViewController - экран где отображается дни рождение знакомых
final class ReminderViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    // MARK: Весь визуал в этом функции

    private func setupUI() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            image: UIImage(systemName: "plus"),
            style: .done,
            target: self,
            action: #selector(clickPlus)
        )
        view.backgroundColor = .systemBackground
        let infoPerson = createInfoList(
            image: UIImage(named: "miss"),
            title: "Helena Link",
            description: "10.03 - turns 25!",
            days: "3 days"
        )
        view.addSubview(infoPerson)
        let infoPerson1 = createInfoList(
            image: UIImage(named: "dama"),
            title: "Verona Tusk",
            description: "20.03 - turns 39",
            days: "12 days"
        )
        view.addSubview(infoPerson1)
        let infoPerson2 = createInfoList(
            image: UIImage(named: "man"),
            title: "Alex Smith",
            description: "21.04 - turns 51",
            days: "32 days"
        )
        view.addSubview(infoPerson2)

        NSLayoutConstraint.activate([
            infoPerson.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            infoPerson.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            infoPerson.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            infoPerson.heightAnchor.constraint(equalToConstant: 93),
            infoPerson1.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            infoPerson1.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            infoPerson1.topAnchor.constraint(equalTo: infoPerson.bottomAnchor, constant: 20),
            infoPerson1.heightAnchor.constraint(equalToConstant: 93),
            infoPerson2.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            infoPerson2.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            infoPerson2.topAnchor.constraint(equalTo: infoPerson1.bottomAnchor, constant: 20),
            infoPerson2.heightAnchor.constraint(equalToConstant: 93),
        ])
    }

    // MARK: Большая функция для блока

    private func createInfoList(image: UIImage?, title: String, description: String, days: String) -> UIView {
        let containerView = UIView()
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.backgroundColor = .purple1
        containerView.layer.cornerRadius = 12

        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(imageView)

        let leftLabel = UILabel()
        leftLabel.text = title
        leftLabel.font = UIFont(name: "Verdana-Bold", size: 14)
        leftLabel.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(leftLabel)

        let descriptionLabel = UILabel()
        descriptionLabel.text = description
        descriptionLabel.font = UIFont(name: "Verdana", size: 14)
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(descriptionLabel)

        let rightLabel = UILabel()
        rightLabel.text = days
        rightLabel.textColor = .purple2
        rightLabel.textAlignment = .center
        rightLabel.numberOfLines = 0
        rightLabel.lineBreakMode = .byWordWrapping
        rightLabel.font = UIFont(name: "Verdana-Bold", size: 14)
        rightLabel.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(rightLabel)

        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 8),
            imageView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 10),
            imageView.widthAnchor.constraint(equalToConstant: 75),
            imageView.heightAnchor.constraint(equalToConstant: 75)

        ])

        NSLayoutConstraint.activate([
            leftLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 8),
            leftLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 25),
        ])

        NSLayoutConstraint.activate([
            descriptionLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 10),
            descriptionLabel.topAnchor.constraint(equalTo: leftLabel.bottomAnchor, constant: 8),
        ])

        NSLayoutConstraint.activate([
            rightLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 25),
            rightLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -10),
            rightLabel.widthAnchor.constraint(equalToConstant: 50)
        ])

        // Возвращаем созданный контейнерный UIView
        return containerView
    }

    // MARK: Оброботчики событие

    @objc func clickPlus() {
        let vc = NewPersonViewController()
        navigationController?.present(vc, animated: true)
    }
}
