// RecomendViewCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// RecomendViewCell
final class RecomendViewCell: UITableViewCell {
    // MARK: Private Property

    private let scrollView = UIScrollView()

    // MARK: Стеквью для истории

    lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 22
        stackView.alignment = .center
        return stackView
    }()

    // MARK: Установка ячейки

    func setupCell(posts: [Recommend]) {
        scrollView.backgroundColor = .recommend
        scrollView.addSubview(stackView)
        contentView.addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        stackView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: contentView.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            scrollView.heightAnchor.constraint(equalToConstant: 270),

            stackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 17),
            stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            stackView.heightAnchor.constraint(equalTo: scrollView.heightAnchor),

        ])

        renderUI(posts: posts)
    }

    // MARK: Оброботка визуала

    private func renderUI(posts: [Recommend]) {
        for post in posts {
            let view = UIView()
            view.backgroundColor = .white
            stackView.addArrangedSubview(view)
            view.translatesAutoresizingMaskIntoConstraints = false

            let imageView = UIImageView()
            imageView.contentMode = .scaleAspectFit
            imageView.clipsToBounds = true
            imageView.image = UIImage(named: post.photo)
            imageView.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(imageView)

            let label = UILabel()
            label.font = UIFont(name: "Verdana", size: 8)
            label.text = post.name
            view.addSubview(label)
            label.translatesAutoresizingMaskIntoConstraints = false

            let button = UIButton()
            button.setTitle("Подписаться", for: .normal)
            button.titleLabel?.textColor = .white
            button.titleLabel?.font = UIFont(name: "Verdana-Bold", size: 10)
            button.backgroundColor = .systemBlue
            button.layer.cornerRadius = 8
            view.addSubview(button)
            button.translatesAutoresizingMaskIntoConstraints = false

            // Верхняя левая метка
            let topLeftLabel = UILabel()
            topLeftLabel.text = "Рекомендуем вам"
            topLeftLabel.font = .boldSystemFont(ofSize: 10)
            contentView.addSubview(topLeftLabel)
            topLeftLabel.translatesAutoresizingMaskIntoConstraints = false

            // Верхняя правая метка
            let topRightLabel = UILabel()
            topRightLabel.text = "Все"
            topRightLabel.textColor = .systemBlue
            topRightLabel.font = .boldSystemFont(ofSize: 10)
            contentView.addSubview(topRightLabel)
            topRightLabel.translatesAutoresizingMaskIntoConstraints = false

            // MARK: Якоря

            NSLayoutConstraint.activate([
                view.heightAnchor.constraint(equalToConstant: 200),
                view.widthAnchor.constraint(equalToConstant: 185),
                view.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 45),
                view.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -25),

                imageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 15),
                imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                imageView.heightAnchor.constraint(equalToConstant: 115),
                imageView.widthAnchor.constraint(equalToConstant: 115),

                label.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 5),
                label.centerXAnchor.constraint(equalTo: imageView.centerXAnchor),

                button.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 9),
                button.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -14),
                button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
                button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
                button.heightAnchor.constraint(equalToConstant: 30),

                topLeftLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
                topLeftLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 9),

                topRightLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 9),
                topRightLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),

            ])
        }
    }
}
