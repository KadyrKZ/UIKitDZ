// NotificationViewCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// NotificationViewCell - ячейка уведомление
final class NotificationViewCell: UITableViewCell {
    // MARK: - Private Constants
    private enum Constants {
        static let timePostPublishTitle = "3д"
        static let subscribeTitle = "Подписаться"
        static let unSubscribeTitle = "Отписаться"
        static let errorTitle = "init(coder:) has not been implemented"
        static let standartFont = "Verdana"
        static let standartBoldFont = "Verdana-Bold"
    }
    // MARK: - Visual Components
    private let avatarImageView = UIImageView()
    private let pictureImageView = UIImageView()
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 12)
        return label
    }()

    // Текст с описание поста

    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.numberOfLines = 0
        return label
    }()

    // Время загрузки поста
    private lazy var timeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .systemGray2
        label.text = Constants.timePostPublishTitle
        return label
    }()

    // Кнопка подписаться

    private lazy var followButton: UIButton = {
        let button = UIButton()
        button.setTitle(Constants.subscribeTitle, for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont(name: Constants.standartBoldFont, size: 10)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 8
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    // Кнопка отписаться

    private lazy var unsubscribeButton: UIButton = {
        let button = UIButton()
        button.setTitle(Constants.unSubscribeTitle, for: .normal)
        button.setTitleColor(.systemGray3, for: .normal)
        button.titleLabel?.font = UIFont(name: Constants.standartBoldFont, size: 10)
        button.backgroundColor = .white
        button.layer.cornerRadius = 8
        button.layer.borderWidth = 1
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    // MARK: - Life Cycle

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        setupCell()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    // MARK: - Public Methods

    func configure(with notification: Notification) {
        avatarImageView.image = UIImage(named: notification.image)
        nameLabel.text = notification.name
        descriptionLabel.text = notification.description
        pictureImageView.image = UIImage(named: notification.picture)

        if notification.isFollowing, notification.picture.isEmpty {
            contentView.addSubview(followButton)
            NSLayoutConstraint.activate([
                followButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
                followButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
                followButton.heightAnchor.constraint(equalToConstant: 30),
                followButton.widthAnchor.constraint(equalToConstant: 140),
            ])
        } else if !notification.isFollowing, notification.picture.isEmpty {
            contentView.addSubview(unsubscribeButton)
            NSLayoutConstraint.activate([
                unsubscribeButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
                unsubscribeButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
                unsubscribeButton.heightAnchor.constraint(equalToConstant: 30),
                unsubscribeButton.widthAnchor.constraint(equalToConstant: 140),
            ])
        } else {
            followButton.removeFromSuperview()
        }
    }

    // MARK: - Private Methods

    private func setupCell() {
        for item in [avatarImageView, nameLabel, descriptionLabel, pictureImageView, timeLabel] {
            item.translatesAutoresizingMaskIntoConstraints = false
            contentView.addSubview(item)
        }
        setupAvatarImageViewConstraints()
        setupNameLabelConstraints()
        setupDescriptionLabelConstraints()
        setupDescriptionLabelConstraints()
        setupPictureImageViewConstraints()
        setupTimeLabelConstraints()
    }
    
    private func setupAvatarImageViewConstraints() {
        NSLayoutConstraint.activate([
            avatarImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            avatarImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            avatarImageView.heightAnchor.constraint(equalToConstant: 40),
            avatarImageView.widthAnchor.constraint(equalToConstant: 40),
            ])
    }
    
    private func setupNameLabelConstraints() {
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 14),
            nameLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 8),
            nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
        ])
    }
    
    private func setupDescriptionLabelConstraints() {
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor),
            descriptionLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 8),
            descriptionLabel.trailingAnchor.constraint(equalTo: pictureImageView.leadingAnchor, constant: -24),

            pictureImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            pictureImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            pictureImageView.heightAnchor.constraint(equalToConstant: 40),
            pictureImageView.widthAnchor.constraint(equalToConstant: 40),

            timeLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 4),
            timeLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 8),
            timeLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -2),
        ])
    }
    
    private func setupPictureImageViewConstraints() {
        NSLayoutConstraint.activate([
            pictureImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            pictureImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            pictureImageView.heightAnchor.constraint(equalToConstant: 40),
            pictureImageView.widthAnchor.constraint(equalToConstant: 40),

            timeLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 4),
            timeLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 8),
            timeLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -2),
        ])
    }
    
    private func setupTimeLabelConstraints() {
        NSLayoutConstraint.activate([
            timeLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 4),
            timeLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 8),
            timeLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -2),
        ])
    }
}
