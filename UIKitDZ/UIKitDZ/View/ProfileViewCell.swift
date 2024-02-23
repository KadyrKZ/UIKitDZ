// ProfileViewCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit
import WebKit

/// ProfileViewCell
class ProfileViewCell: UITableViewCell {
    let profileView = UIView()
    private let standartFont = "Verdana"
    private let standartBoldFont = "Verdana-Bold"

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupProfileView()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupProfileView()
    }

    private func setupProfileView() {
        contentView.addSubview(profileView)
        profileView.translatesAutoresizingMaskIntoConstraints = false
        createProfileView()

        NSLayoutConstraint.activate([
            profileView.topAnchor.constraint(equalTo: contentView.topAnchor),
            profileView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            profileView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            profileView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            profileView.heightAnchor.constraint(equalToConstant: 220)
        ])
    }

    private func makeLabel(text: String, font: String, size: CGFloat) -> UILabel {
        let label = UILabel()
        label.text = text
        label.font = UIFont(name: font, size: size)
        label.textColor = .black
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        profileView.addSubview(label)
        return label
    }

    func createProfileView() -> UIView {
        let profileImage = UIImageView()
        profileImage.image = .myPhoto
        profileImage.translatesAutoresizingMaskIntoConstraints = false
        profileView.addSubview(profileImage)

        let countPublicationLabel = makeLabel(text: "67", font: standartBoldFont, size: 14)
        let publicationLabel = makeLabel(text: "публикации", font: standartFont, size: 10)
        let followersLabel = makeLabel(text: "подписчики", font: standartFont, size: 10)
        let follewedLabel = makeLabel(text: "подписки", font: standartFont, size: 10)
        let countFollowersLabel = makeLabel(text: "458", font: standartBoldFont, size: 14)
        let countFollewedLabel = makeLabel(text: "120", font: standartBoldFont, size: 14)
        let nameLabel = makeLabel(text: "Мария Иванова", font: standartBoldFont, size: 14)
        let major = makeLabel(text: "Консультат", font: standartFont, size: 14)

        let spacexButton = UIButton()
        spacexButton.setTitle("www.spacex.com", for: .normal)
        spacexButton.setTitleColor(.systemBlue, for: .normal)
        spacexButton.titleLabel?.font = UIFont(name: standartFont, size: 14)
        spacexButton.addTarget(self, action: #selector(openSpaceXWebsite), for: .touchUpInside)
        spacexButton.translatesAutoresizingMaskIntoConstraints = false
        profileView.addSubview(spacexButton)

        let changeButton = UIButton(type: .custom)
        changeButton.setTitle("Изменить", for: .normal)
        changeButton.setTitleColor(.black, for: .normal)
        changeButton.backgroundColor = .systemGray3
        changeButton.titleLabel?.font = UIFont(name: standartBoldFont, size: 10)
        changeButton.layer.cornerRadius = 8
        changeButton.translatesAutoresizingMaskIntoConstraints = false
        profileView.addSubview(changeButton)

        let shareProfileButton = UIButton(type: .custom)
        shareProfileButton.setTitle("Поделиться профилем", for: .normal)
        shareProfileButton.setTitleColor(.black, for: .normal)
        shareProfileButton.titleLabel?.font = UIFont(name: standartBoldFont, size: 10)
        shareProfileButton.backgroundColor = .systemGray3
        shareProfileButton.layer.cornerRadius = 8
        shareProfileButton.translatesAutoresizingMaskIntoConstraints = false
        profileView.addSubview(shareProfileButton)

        let addFriendButton = UIButton(type: .custom)
        addFriendButton.setImage(.profile, for: .normal)
        addFriendButton.titleLabel?.font = UIFont(name: standartBoldFont, size: 10)
        addFriendButton.backgroundColor = .systemGray3
        addFriendButton.layer.cornerRadius = 4
        addFriendButton.translatesAutoresizingMaskIntoConstraints = false
        profileView.addSubview(addFriendButton)

        // Добавление констрейнтов

        NSLayoutConstraint.activate([
            profileImage.topAnchor.constraint(equalTo: profileView.topAnchor, constant: 15),
            profileImage.leadingAnchor.constraint(equalTo: profileView.leadingAnchor, constant: 15),
            profileImage.widthAnchor.constraint(equalToConstant: 80),
            profileImage.heightAnchor.constraint(equalToConstant: 80),

            countPublicationLabel.topAnchor.constraint(equalTo: profileImage.topAnchor, constant: 10),
            countPublicationLabel.leadingAnchor.constraint(equalTo: profileImage.trailingAnchor, constant: 56),
            countPublicationLabel.widthAnchor.constraint(equalToConstant: 50),

            publicationLabel.topAnchor.constraint(equalTo: countPublicationLabel.bottomAnchor, constant: 2),
            publicationLabel.centerXAnchor.constraint(equalTo: countPublicationLabel.centerXAnchor),

            countFollowersLabel.topAnchor.constraint(equalTo: profileImage.topAnchor, constant: 10),
            countFollowersLabel.leadingAnchor.constraint(equalTo: countPublicationLabel.trailingAnchor, constant: 20),
            countFollowersLabel.widthAnchor.constraint(equalToConstant: 50),

            followersLabel.topAnchor.constraint(equalTo: countFollowersLabel.bottomAnchor, constant: 2),
            followersLabel.centerXAnchor.constraint(equalTo: countFollowersLabel.centerXAnchor),

            countFollewedLabel.topAnchor.constraint(equalTo: profileImage.topAnchor, constant: 10),
            countFollewedLabel.leadingAnchor.constraint(equalTo: countFollowersLabel.trailingAnchor, constant: 20),
            countFollewedLabel.widthAnchor.constraint(equalToConstant: 50),

            follewedLabel.topAnchor.constraint(equalTo: countFollewedLabel.bottomAnchor, constant: 2),
            follewedLabel.centerXAnchor.constraint(equalTo: countFollewedLabel.centerXAnchor),

            nameLabel.topAnchor.constraint(equalTo: profileImage.bottomAnchor, constant: 10),
            nameLabel.leadingAnchor.constraint(equalTo: profileView.leadingAnchor, constant: 15),

            major.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 11),
            major.leadingAnchor.constraint(equalTo: profileView.leadingAnchor, constant: 15),

            spacexButton.topAnchor.constraint(equalTo: major.bottomAnchor, constant: 6),
            spacexButton.leadingAnchor.constraint(equalTo: profileView.leadingAnchor, constant: 34),
            spacexButton.widthAnchor.constraint(equalToConstant: 140),
            spacexButton.heightAnchor.constraint(equalToConstant: 27),

            changeButton.topAnchor.constraint(equalTo: spacexButton.bottomAnchor, constant: 15),
            changeButton.leadingAnchor.constraint(equalTo: profileView.leadingAnchor, constant: 15),
            changeButton.widthAnchor.constraint(equalToConstant: 155),
            changeButton.heightAnchor.constraint(equalToConstant: 27),

            shareProfileButton.topAnchor.constraint(equalTo: spacexButton.bottomAnchor, constant: 15),
            shareProfileButton.leadingAnchor.constraint(equalTo: changeButton.trailingAnchor, constant: 5),
            shareProfileButton.widthAnchor.constraint(equalToConstant: 155),
            shareProfileButton.heightAnchor.constraint(equalToConstant: 27),

            addFriendButton.topAnchor.constraint(equalTo: spacexButton.bottomAnchor, constant: 15),
            addFriendButton.trailingAnchor.constraint(equalTo: profileView.trailingAnchor, constant: -15),
            addFriendButton.widthAnchor.constraint(equalToConstant: 25),
            addFriendButton.heightAnchor.constraint(equalToConstant: 27)
        ])

        return profileView
    }

    @objc private func openSpaceXWebsite() {
        let webView = WKWebView(frame: UIScreen.main.bounds)

        if let url = URL(string: "https://www.spacex.com") {
            webView.load(URLRequest(url: url))
        }

        let webViewController = UIViewController()
        webViewController.view.addSubview(webView)
        webView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            webView.topAnchor.constraint(equalTo: webViewController.view.topAnchor),
            webView.leadingAnchor.constraint(equalTo: webViewController.view.leadingAnchor),
            webView.trailingAnchor.constraint(equalTo: webViewController.view.trailingAnchor),
            webView.bottomAnchor.constraint(equalTo: webViewController.view.bottomAnchor)
        ])

        let closeButton = UIButton(type: .system)
        closeButton.setTitle("X", for: .normal)
        closeButton.addTarget(self, action: #selector(closeWebView), for: .touchUpInside)
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        webViewController.view.addSubview(closeButton)
        NSLayoutConstraint.activate([
            closeButton.topAnchor.constraint(
                equalTo: webViewController.view.safeAreaLayoutGuide.topAnchor,
                constant: 20
            ),
            closeButton.leadingAnchor.constraint(equalTo: webViewController.view.leadingAnchor, constant: 20)
        ])

        if let topViewController = UIApplication.shared.windows.first(where: { $0.isKeyWindow })?.rootViewController {
            webViewController.modalPresentationStyle = .fullScreen
            topViewController.present(webViewController, animated: true, completion: nil)
        }
    }

    @objc private func closeWebView() {
        if let topViewController = UIApplication.shared.windows.first(where: { $0.isKeyWindow })?.rootViewController {
            topViewController.dismiss(animated: true, completion: nil)
        }
    }
}
