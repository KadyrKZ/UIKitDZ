// RecomendationViewCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// RecomendationViewCell ячейка с рекоммендациями
final class RecomendationViewCell: UITableViewCell {
    // MARK: Private Property

    private let standartFont = "Verdana"
    private let standartBoldFont = "Verdana-Bold"
    private let subscribeTitle = "Подписаться"
    private let recommendationTitle = "Рекомендуем вам"
    private let allRecommendationTitle = "Все"
    private let scrollView = UIScrollView()
    // Стеквью для истории
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 22
        return stackView
    }()

    // Установка ячейки

    // MARK: - Public Methods

    func setup(with recomendations: [Recommendation]) {
        scrollView.backgroundColor = .recommendation
        scrollView.addSubview(stackView)
        contentView.addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        stackView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: contentView.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),

            stackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 17),
            stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            stackView.heightAnchor.constraint(equalTo: scrollView.heightAnchor),
        ])
        renderUI(posts: recomendations)
    }

    // MARK: - Private Methods

    private func renderUI(posts: [Recommendation]) {
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
            label.font = UIFont(name: standartFont, size: 8)
            label.text = post.name
            view.addSubview(label)
            label.translatesAutoresizingMaskIntoConstraints = false

            let button = UIButton()
            button.setTitle(subscribeTitle, for: .normal)
            button.titleLabel?.textColor = .white
            button.titleLabel?.font = UIFont(name: standartBoldFont, size: 10)
            button.backgroundColor = .systemBlue
            button.layer.cornerRadius = 8
            view.addSubview(button)
            button.translatesAutoresizingMaskIntoConstraints = false

            let topLeftLabel = UILabel()
            topLeftLabel.text = recommendationTitle
            topLeftLabel.font = .boldSystemFont(ofSize: 10)
            contentView.addSubview(topLeftLabel)
            topLeftLabel.translatesAutoresizingMaskIntoConstraints = false

            let topRightLabel = UILabel()
            topRightLabel.text = allRecommendationTitle
            topRightLabel.textColor = .systemBlue
            topRightLabel.font = .boldSystemFont(ofSize: 10)
            contentView.addSubview(topRightLabel)
            topRightLabel.translatesAutoresizingMaskIntoConstraints = false

            setupConstraints()
            func setupConstraints() {
                NSLayoutConstraint.activate([
                    //   view.heightAnchor.constraint(equalToConstant: 200),
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
}
