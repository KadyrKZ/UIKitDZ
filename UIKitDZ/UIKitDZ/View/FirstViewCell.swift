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

    // MARK: - Public Methods

    func setup(with post: Other) {
        postImages = [post.photo, post.photo, post.photo]
        let imageView = makeImageView(imageName: post.photo)
        let avatarImage = makeImageView(imageName: post.friendPhoto)

        let label = UILabel()
        label.font = UIFont(name: standartFont, size: 12)
        label.text = post.name
        contentView.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false

        let likeButton = makeButton(imageName: likeImageName)
        let commentButton = makeButton(imageName: commentImageName)
        let shareButton = makeButton(imageName: sendImageName)
        let bookmarkButton = makeButton(imageName: bookmarkImageName)

        let likeLabel = UILabel()
        likeLabel.font = UIFont(name: standartFont, size: 10)
        likeLabel.text = likeCountTitle
        likeLabel.textColor = .black
        contentView.addSubview(likeLabel)
        likeLabel.translatesAutoresizingMaskIntoConstraints = false

        let titleLabel = UILabel()
        titleLabel.font = UIFont.boldSystemFont(ofSize: 10)
        titleLabel.text = simpleTitle
        titleLabel.textColor = .black
        contentView.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false

        let descriptionLabel = UILabel()
        descriptionLabel.font = UIFont.systemFont(ofSize: 10)
        descriptionLabel.text = justTitle
        descriptionLabel.textColor = .black
        contentView.addSubview(descriptionLabel)
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false

        let avatarImageView = makeImageView(imageName: post.myPhoto)

        let commentButtonLabel = UILabel()
        commentButtonLabel.text = commentDotsTitle
        commentButtonLabel.font = UIFont.systemFont(ofSize: 10)
        commentButtonLabel.textColor = .systemGray2
        contentView.addSubview(commentButtonLabel)
        commentButtonLabel.translatesAutoresizingMaskIntoConstraints = false

        let timeLabel = UILabel()
        timeLabel.text = timeTitle
        timeLabel.font = UIFont.systemFont(ofSize: 10)
        timeLabel.textColor = .systemGray2
        contentView.addSubview(timeLabel)
        timeLabel.translatesAutoresizingMaskIntoConstraints = false

        let moreOptionsButton = makeButton(imageName: optionImageName)

        setupConstraints()
        func setupConstraints() {
            NSLayoutConstraint.activate([
                avatarImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
                avatarImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
                avatarImage.heightAnchor.constraint(equalToConstant: 30),
                avatarImage.widthAnchor.constraint(equalToConstant: 30),

                label.centerYAnchor.constraint(equalTo: avatarImage.centerYAnchor),
                label.leadingAnchor.constraint(equalTo: avatarImage.trailingAnchor, constant: 6),

                moreOptionsButton.centerYAnchor.constraint(equalTo: avatarImage.centerYAnchor),
                moreOptionsButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -9),
                moreOptionsButton.widthAnchor.constraint(equalToConstant: 24),
                moreOptionsButton.heightAnchor.constraint(equalToConstant: 24),

                imageView.topAnchor.constraint(equalTo: avatarImage.bottomAnchor, constant: 10),
                imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
                imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
                imageView.heightAnchor.constraint(equalToConstant: 239),

                likeButton.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 8),
                likeButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
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
                bookmarkButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -9),
                bookmarkButton.widthAnchor.constraint(equalToConstant: 24),
                bookmarkButton.heightAnchor.constraint(equalToConstant: 24),

                likeLabel.topAnchor.constraint(equalTo: likeButton.bottomAnchor, constant: 6),
                likeLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),

                titleLabel.topAnchor.constraint(equalTo: likeLabel.bottomAnchor, constant: 6),
                titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),

                descriptionLabel.topAnchor.constraint(equalTo: likeLabel.bottomAnchor, constant: 6),
                descriptionLabel.leadingAnchor.constraint(equalTo: titleLabel.trailingAnchor, constant: 4),

                avatarImageView.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 4),
                avatarImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
                avatarImageView.widthAnchor.constraint(equalToConstant: 20),
                avatarImageView.heightAnchor.constraint(equalToConstant: 20),

                commentButtonLabel.centerYAnchor.constraint(equalTo: avatarImageView.centerYAnchor),
                commentButtonLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 3),

                timeLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
                timeLabel.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 4),
                timeLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -4),

            ])
        }
    }

    // Для создание фото
    private func makeImageView(imageName: String) -> UIImageView {
        let imageView = UIImageView()
        imageView.image = UIImage(named: imageName)
        contentView.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }

    // Для создание кнопки
    private func makeButton(imageName: String) -> UIButton {
        let button = UIButton()
        button
            .setImage(
                UIImage(named: imageName),
                for: .normal
            )
        contentView.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }
}
