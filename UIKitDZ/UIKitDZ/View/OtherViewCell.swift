// OtherViewCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// OtherViewCell
class OtherViewCell: UITableViewCell {
    let scrollView = UIScrollView()

    lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        return stackView
    }()

    func setupCell(post: [Other]) {
        scrollView.addSubview(stackView)
        contentView.addSubview(scrollView)

        scrollView.translatesAutoresizingMaskIntoConstraints = false
        stackView.translatesAutoresizingMaskIntoConstraints = false

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

        ])

        renderUI(posts: post)
    }

    private func renderUI(posts: [Other]) {
        for post in posts {
            let view = UIView()
            stackView.addSubview(view)
            view.translatesAutoresizingMaskIntoConstraints = false

            let imageView = makeImage(imageName: post.photo, in: view)

            let avatarImage = makeImage(imageName: post.friendPhoto, in: view)

            let label = UILabel()
            label.font = UIFont(name: "Verdana", size: 12)
            label.text = post.name
            view.addSubview(label)
            label.translatesAutoresizingMaskIntoConstraints = false

            let likeButton = makeButton(imageName: "like", in: view)

            let commentButton = makeButton(imageName: "comment", in: view)

            let shareButton = makeButton(imageName: "send", in: view)
            let bookmarkButton = makeButton(imageName: "bookmark", in: view)

            let likeLabel = UILabel()
            likeLabel.font = UIFont(name: "Verdana", size: 10)
            likeLabel.text = "Нравится : 201"
            likeLabel.textColor = .black
            view.addSubview(likeLabel)
            likeLabel.translatesAutoresizingMaskIntoConstraints = false

            let titleLabel = UILabel()
            titleLabel.font = UIFont.boldSystemFont(ofSize: 10)
            titleLabel.text = "dscas"
            titleLabel.textColor = .black
            view.addSubview(titleLabel)
            titleLabel.translatesAutoresizingMaskIntoConstraints = false

            let descriptionLabel = UILabel()
            descriptionLabel.font = UIFont.systemFont(ofSize: 10)
            descriptionLabel.text = "post.description"
            descriptionLabel.textColor = .black
            view.addSubview(descriptionLabel)
            descriptionLabel.translatesAutoresizingMaskIntoConstraints = false

            let avatarImageView = makeImage(imageName: post.myPhoto, in: view)

            let commentButtonLabel = UILabel()
            commentButtonLabel.text = "Комментировать..."
            commentButtonLabel.font = UIFont.systemFont(ofSize: 10)
            commentButtonLabel.textColor = .systemGray2
            view.addSubview(commentButtonLabel)
            commentButtonLabel.translatesAutoresizingMaskIntoConstraints = false

            let timeLabel = UILabel()
            timeLabel.text = "10 минут назад"
            timeLabel.font = UIFont.systemFont(ofSize: 10)
            timeLabel.textColor = .systemGray2
            view.addSubview(timeLabel)
            timeLabel.translatesAutoresizingMaskIntoConstraints = false

            let moreOptionsButton = makeButton(imageName: "optionImage", in: view)

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

                // Расположение и размеры иконки сообщения
                commentButton.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 8),
                commentButton.leadingAnchor.constraint(equalTo: likeButton.trailingAnchor, constant: 8),
                commentButton.heightAnchor.constraint(equalToConstant: 24),
                commentButton.widthAnchor.constraint(equalToConstant: 24),

                // Расположение и размеры иконки самолетика
                shareButton.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 8),
                shareButton.leadingAnchor.constraint(equalTo: commentButton.trailingAnchor, constant: 8),
                shareButton.widthAnchor.constraint(equalToConstant: 24),
                shareButton.heightAnchor.constraint(equalToConstant: 24),

                // Расположение и размеры иконки закладки
                bookmarkButton.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 8),
                bookmarkButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -9),
                bookmarkButton.widthAnchor.constraint(equalToConstant: 24),
                bookmarkButton.heightAnchor.constraint(equalToConstant: 24),

                // Расположение и размеры метки "Нравится"
                likeLabel.topAnchor.constraint(equalTo: likeButton.bottomAnchor, constant: 6),
                likeLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12),

                // Расположение и размеры названия фото
                titleLabel.topAnchor.constraint(equalTo: likeLabel.bottomAnchor, constant: 6),
                titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12),

                // Расположение и размеры описания фото
                descriptionLabel.topAnchor.constraint(equalTo: likeLabel.bottomAnchor, constant: 6),
                descriptionLabel.leadingAnchor.constraint(equalTo: titleLabel.trailingAnchor, constant: 4),

                // Расположение и размеры аватара пользователя
                avatarImageView.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 4),
                avatarImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12),
                avatarImageView.widthAnchor.constraint(equalToConstant: 20),
                avatarImageView.heightAnchor.constraint(equalToConstant: 20),

                // Расположение и размеры метки "Комментировать..."
                commentButtonLabel.centerYAnchor.constraint(equalTo: avatarImageView.centerYAnchor),
                commentButtonLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 3),

                timeLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12),
                timeLabel.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 4),
            ])
        }

        func makeImage(imageName: String, in view: UIView) -> UIImageView {
            let imageView = UIImageView()
            imageView.image = UIImage(named: imageName)
            view.addSubview(imageView)
            imageView.translatesAutoresizingMaskIntoConstraints = false
            return imageView
        }

        func makeButton(imageName: String, in view: UIView) -> UIButton {
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
}
