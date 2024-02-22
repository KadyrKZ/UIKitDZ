// FirstViewCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// FirstViewCell - первый пост
final class FirstViewCell: UITableViewCell {
    // MARK: Private Proporties

    private let standartFont = "Verdana"
    private let standartBoldFont = "Verdana-Bold"
    private let likeImageName = "like"
    private let commentImageName = "comment"
    private let sendImageName = "send"
    private let bookmarkImageName = "bookmark"
    private let likeCountTitle = "Нравится : 201"
    private let simpleTitle = "Let's go"
    private let justTitle = "Все круто"
    private let commentDotsTitle = "Комментировать..."
    private let timeTitle = "10 минут назад"
    private let optionImageName = "optionImage"
    private var postImages: [String] = []

    // MARK: - Visual Components

    private let scrollView = UIScrollView()
    private let pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.numberOfPages = 3
        pageControl.tintColor = .black
        pageControl.backgroundStyle = .minimal
        return pageControl
    }()

    // Стеквью ячейки добавляется в стек

    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .center
        return stackView
    }()

    // MARK: - Public Methods

    func setup(with post: Other) {
        scrollView.addSubview(stackView)
        contentView.addSubview(scrollView)
        contentView.addSubview(pageControl)

        scrollView.translatesAutoresizingMaskIntoConstraints = false
        stackView.translatesAutoresizingMaskIntoConstraints = false
        pageControl.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: contentView.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            scrollView.heightAnchor.constraint(equalToConstant: 411),

            stackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            stackView.heightAnchor.constraint(equalTo: scrollView.heightAnchor),

            pageControl.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -90),
            pageControl.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            pageControl.heightAnchor.constraint(equalToConstant: 10),
        ])

        renderUI(post: post)
    }

    // Обрабатываем визуал

    private func renderUI(post: Other) {
        let view = UIView()
        stackView.addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false

        postImages = [post.photo, post.photo, post.photo]
        let imageView = makeImageView(imageName: post.photo, in: view)
        let avatarImage = makeImageView(imageName: post.friendPhoto, in: view)

        let label = UILabel()
        label.font = UIFont(name: standartFont, size: 12)
        label.text = post.name
        view.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false

        let likeButton = makeButton(imageName: likeImageName, in: view)
        let commentButton = makeButton(imageName: commentImageName, in: view)
        let shareButton = makeButton(imageName: sendImageName, in: view)
        let bookmarkButton = makeButton(imageName: bookmarkImageName, in: view)

        let likeLabel = UILabel()
        likeLabel.font = UIFont(name: standartFont, size: 10)
        likeLabel.text = likeCountTitle
        likeLabel.textColor = .black
        view.addSubview(likeLabel)
        likeLabel.translatesAutoresizingMaskIntoConstraints = false

        let titleLabel = UILabel()
        titleLabel.font = UIFont.boldSystemFont(ofSize: 10)
        titleLabel.text = simpleTitle
        titleLabel.textColor = .black
        view.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false

        let descriptionLabel = UILabel()
        descriptionLabel.font = UIFont.systemFont(ofSize: 10)
        descriptionLabel.text = justTitle
        descriptionLabel.textColor = .black
        view.addSubview(descriptionLabel)
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false

        let avatarImageView = makeImageView(imageName: post.myPhoto, in: view)

        let commentButtonLabel = UILabel()
        commentButtonLabel.text = commentDotsTitle
        commentButtonLabel.font = UIFont.systemFont(ofSize: 10)
        commentButtonLabel.textColor = .systemGray2
        view.addSubview(commentButtonLabel)
        commentButtonLabel.translatesAutoresizingMaskIntoConstraints = false

        let timeLabel = UILabel()
        timeLabel.text = timeTitle
        timeLabel.font = UIFont.systemFont(ofSize: 10)
        timeLabel.textColor = .systemGray2
        view.addSubview(timeLabel)
        timeLabel.translatesAutoresizingMaskIntoConstraints = false

        let moreOptionsButton = makeButton(imageName: optionImageName, in: view)

        setupConstraints()
        func setupConstraints() {
            NSLayoutConstraint.activate([
                view.heightAnchor.constraint(equalToConstant: 411),
                view.widthAnchor.constraint(equalToConstant: 375),

                avatarImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
                avatarImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12),
                avatarImage.heightAnchor.constraint(equalToConstant: 30),
                avatarImage.widthAnchor.constraint(equalToConstant: 30),

                label.centerYAnchor.constraint(equalTo: avatarImage.centerYAnchor),
                label.leadingAnchor.constraint(equalTo: avatarImage.trailingAnchor, constant: 6),

                moreOptionsButton.centerYAnchor.constraint(equalTo: avatarImage.centerYAnchor),
                moreOptionsButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -9),
                moreOptionsButton.widthAnchor.constraint(equalToConstant: 24),
                moreOptionsButton.heightAnchor.constraint(equalToConstant: 24),

                imageView.topAnchor.constraint(equalTo: avatarImage.bottomAnchor, constant: 10),
                imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                imageView.heightAnchor.constraint(equalToConstant: 239),
                imageView.widthAnchor.constraint(equalToConstant: 375),

                likeButton.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 8),
                likeButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12),
                likeButton.widthAnchor.constraint(equalToConstant: 24),
                likeButton.heightAnchor.constraint(equalToConstant: 24),

                commentButton.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 8),
                commentButton.leadingAnchor.constraint(equalTo: likeButton.trailingAnchor, constant: 8),
                commentButton.heightAnchor.constraint(equalToConstant: 24),
                commentButton.widthAnchor.constraint(equalToConstant: 24),

                shareButton.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 8),
                shareButton.leadingAnchor.constraint(equalTo: commentButton.trailingAnchor, constant: 8),
                shareButton.widthAnchor.constraint(equalToConstant: 24),
                shareButton.heightAnchor.constraint(equalToConstant: 24),

                bookmarkButton.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 8),
                bookmarkButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -9),
                bookmarkButton.widthAnchor.constraint(equalToConstant: 24),
                bookmarkButton.heightAnchor.constraint(equalToConstant: 24),

                likeLabel.topAnchor.constraint(equalTo: likeButton.bottomAnchor, constant: 6),
                likeLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12),

                titleLabel.topAnchor.constraint(equalTo: likeLabel.bottomAnchor, constant: 6),
                titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12),

                descriptionLabel.topAnchor.constraint(equalTo: likeLabel.bottomAnchor, constant: 6),
                descriptionLabel.leadingAnchor.constraint(equalTo: titleLabel.trailingAnchor, constant: 4),

                avatarImageView.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 4),
                avatarImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12),
                avatarImageView.widthAnchor.constraint(equalToConstant: 20),
                avatarImageView.heightAnchor.constraint(equalToConstant: 20),

                commentButtonLabel.centerYAnchor.constraint(equalTo: avatarImageView.centerYAnchor),
                commentButtonLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 3),

                timeLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12),
                timeLabel.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 4),
            ])
        }
    }

    // Для создание фото
    private func makeImageView(imageName: String, in view: UIView) -> UIImageView {
        let imageView = UIImageView()
        imageView.image = UIImage(named: imageName)
        view.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }

    // Для создание кнопки
    private func makeButton(imageName: String, in view: UIView) -> UIButton {
        let button = UIButton()
        button
            .setImage(
                UIImage(named: imageName),
                for: .normal
            )
        view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }
}
