// NotificationViewCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// NotificationViewCell
class NotificationViewCell: UITableViewCell {
    let avatar = UIImageView()
    let picture = UIImageView()
    let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 12)
        return label
    }()

    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.numberOfLines = 0
        return label
    }()

    let time: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .systemGray2
        label.text = "3д"
        return label
    }()

    let followButton: UIButton = {
        let button = UIButton()
        button.setTitle("Подписаться", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont(name: "Verdana-Bold", size: 10)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 8
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    let unsubscribeButton: UIButton = {
        let button = UIButton()
        button.setTitle("Отписаться", for: .normal)
        button.setTitleColor(.systemGray3, for: .normal)
        button.titleLabel?.font = UIFont(name: "Verdana-Bold", size: 10)
        button.backgroundColor = .white
        button.layer.cornerRadius = 8
        button.layer.borderWidth = 1
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCell()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupCell() {
        for item in [avatar, nameLabel, descriptionLabel, picture, time] {
            item.translatesAutoresizingMaskIntoConstraints = false
            contentView.addSubview(item)
        }
        NSLayoutConstraint.activate([
            avatar.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            avatar.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            avatar.heightAnchor.constraint(equalToConstant: 40),
            avatar.widthAnchor.constraint(equalToConstant: 40),

            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 14),
            nameLabel.leadingAnchor.constraint(equalTo: avatar.trailingAnchor, constant: 8),
            nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),

            descriptionLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor),
            descriptionLabel.leadingAnchor.constraint(equalTo: avatar.trailingAnchor, constant: 8),
            descriptionLabel.trailingAnchor.constraint(equalTo: picture.leadingAnchor, constant: -24),

            picture.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            picture.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            picture.heightAnchor.constraint(equalToConstant: 40),
            picture.widthAnchor.constraint(equalToConstant: 40),

            time.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 4),
            time.leadingAnchor.constraint(equalTo: avatar.trailingAnchor, constant: 8),
            time.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -2),

        ])
    }

    func configure(contact: Notification) {
        avatar.image = contact.image
        nameLabel.text = contact.name
        descriptionLabel.text = contact.description
        picture.image = contact.picture

        if contact.isFollowing, contact.picture == nil {
            contentView.addSubview(followButton)
            NSLayoutConstraint.activate([
                followButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
                followButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
                followButton.heightAnchor.constraint(equalToConstant: 30),
                followButton.widthAnchor.constraint(equalToConstant: 140),
            ])
        } else if !contact.isFollowing, contact.picture == nil {
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
}
