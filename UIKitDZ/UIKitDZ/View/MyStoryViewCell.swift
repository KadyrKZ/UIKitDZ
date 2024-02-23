// MyStoryViewCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// MyStoryViewCell
class MyStoryViewCell: UITableViewCell {
    // MARK: Private Property

    private let standartFont = "Verdana"
    private let standartBoldFont = "Verdana-Bold"
    private let myPhotoTitle = "myPhoto"
    private let backPlusTitle = "backPlus"
    private let yourStoryTitle = "Ваша история"
    private let plusTitle = "+"
    private let scrollView = UIScrollView()

    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 22
        stackView.alignment = .center
        return stackView
    }()

    // Установка ячейки

    // MARK: - Public Methods

    func setup(with posts: [Story]) {
        scrollView.addSubview(stackView)
        contentView.addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        stackView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            scrollView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            scrollView.heightAnchor.constraint(equalToConstant: 124),

            stackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 12),
            stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            stackView.heightAnchor.constraint(equalTo: scrollView.heightAnchor),
        ])
        renderUI(stories: posts)
    }

    // Оброботка визуала
    private func renderUI(stories: [Story]) {
        stackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
        // Создаем первую ячейку с другой фотографией и текстом
        let firstView = UIView()
        stackView.addArrangedSubview(firstView)
        firstView.translatesAutoresizingMaskIntoConstraints = false

        let firstImageView = UIImageView()
        firstImageView.contentMode = .scaleAspectFit
        firstImageView.clipsToBounds = true
        firstImageView.image = UIImage(named: myPhotoTitle)
        firstImageView.translatesAutoresizingMaskIntoConstraints = false
        firstView.addSubview(firstImageView)

        let backImageView = UIImageView()
        backImageView.layer.cornerRadius = 10
        backImageView.image = UIImage(named: backPlusTitle)
        backImageView.translatesAutoresizingMaskIntoConstraints = false
        firstView.addSubview(backImageView)

        let addLabel = UILabel()
        addLabel.font = UIFont(name: standartBoldFont, size: 15)
        addLabel.textColor = .white
        addLabel.text = plusTitle
        backImageView.addSubview(addLabel)
        addLabel.translatesAutoresizingMaskIntoConstraints = false

        let firstLabel = UILabel()
        firstLabel.font = UIFont(name: standartFont, size: 8)
        firstLabel.textColor = .gray
        firstLabel.text = yourStoryTitle
        firstView.addSubview(firstLabel)
        firstLabel.translatesAutoresizingMaskIntoConstraints = false

        setupConstraints()
        makePost()
        // Посты с историями
        func makePost() {
            for post in stories {
                let view = UIView()
                stackView.addArrangedSubview(view)
                view.translatesAutoresizingMaskIntoConstraints = false

                let imageView = UIImageView()
                imageView.contentMode = .scaleAspectFit
                imageView.clipsToBounds = true
                imageView.image = UIImage(named: post.photo)
                imageView.layer.cornerRadius = 30
                if post.viewed {
                    imageView.layer.borderColor = CGColor(red: 0.7, green: 0.4, blue: 0.3, alpha: 1)
                    imageView.layer.borderWidth = 2
                }
                view.addSubview(imageView)
                imageView.translatesAutoresizingMaskIntoConstraints = false

                let label = UILabel()
                label.font = UIFont(name: standartFont, size: 8)
                label.text = post.name
                view.addSubview(label)
                label.translatesAutoresizingMaskIntoConstraints = false

                setupConstraints()
                func setupConstraints() {
                    NSLayoutConstraint.activate([
                        view.heightAnchor.constraint(equalToConstant: 80),
                        view.widthAnchor.constraint(equalToConstant: 60),
                        imageView.topAnchor.constraint(equalTo: view.topAnchor),
                        imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                        imageView.heightAnchor.constraint(equalToConstant: 60),
                        imageView.widthAnchor.constraint(equalToConstant: 60),
                        label.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 5),
                        label.centerXAnchor.constraint(equalTo: imageView.centerXAnchor),
                    ])
                }
            }
        }

        func setupConstraints() {
            NSLayoutConstraint.activate([
                firstView.heightAnchor.constraint(equalToConstant: 80),
                firstView.widthAnchor.constraint(equalToConstant: 60),

                firstImageView.topAnchor.constraint(equalTo: firstView.topAnchor),
                firstImageView.leadingAnchor.constraint(equalTo: firstView.leadingAnchor),
                firstImageView.heightAnchor.constraint(equalToConstant: 60),
                firstImageView.widthAnchor.constraint(equalToConstant: 60),

                backImageView.bottomAnchor.constraint(equalTo: firstImageView.bottomAnchor),
                backImageView.trailingAnchor.constraint(equalTo: firstImageView.trailingAnchor),
                backImageView.heightAnchor.constraint(equalToConstant: 20),
                backImageView.widthAnchor.constraint(equalToConstant: 20),

                addLabel.centerXAnchor.constraint(equalTo: backImageView.centerXAnchor),
                addLabel.centerYAnchor.constraint(equalTo: backImageView.centerYAnchor),

                firstLabel.topAnchor.constraint(equalTo: firstImageView.bottomAnchor, constant: 5),
                firstLabel.centerXAnchor.constraint(equalTo: firstImageView.centerXAnchor),
            ])
        }
    }
}
