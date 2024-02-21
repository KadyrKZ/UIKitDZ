// StoryViewCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// StoryViewCell
class StoryViewCell: UITableViewCell {
    let scrollView = UIScrollView()

    lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 22
        stackView.alignment = .center

        return stackView
    }()

    func setupCell(posts: [Story]) {
        scrollView.addSubview(stackView)
        contentView.addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        stackView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: contentView.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            scrollView.heightAnchor.constraint(equalToConstant: 80),

            stackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 12),
            stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            stackView.heightAnchor.constraint(equalTo: scrollView.heightAnchor),

        ])

        renderUI(posts: posts)
    }

    private func renderUI(posts: [Story]) {
        stackView.arrangedSubviews.forEach { $0.removeFromSuperview() }

        // Создаем первую ячейку с другой фотографией и текстом
        let firstView = UIView()
        stackView.addArrangedSubview(firstView)
        firstView.translatesAutoresizingMaskIntoConstraints = false

        let firstImageView = UIImageView()
        firstImageView.contentMode = .scaleAspectFit
        firstImageView.clipsToBounds = true
        firstImageView.image = UIImage(named: "myPhoto")
        firstImageView.translatesAutoresizingMaskIntoConstraints = false
        firstView.addSubview(firstImageView)

        let backImageView = UIImageView()
        backImageView.layer.cornerRadius = 10
        backImageView.image = UIImage(named: "backPlus")
        backImageView.translatesAutoresizingMaskIntoConstraints = false
        firstView.addSubview(backImageView)

        let addLabel = UILabel()
        addLabel.font = UIFont(name: "Verdana-Bold", size: 15)
        addLabel.textColor = .white
        addLabel.text = "+"
        backImageView.addSubview(addLabel)
        addLabel.translatesAutoresizingMaskIntoConstraints = false

        let firstLabel = UILabel()
        firstLabel.font = UIFont(name: "Verdana", size: 8)
        firstLabel.textColor = .gray
        firstLabel.text = "Ваша история"
        firstView.addSubview(firstLabel)
        firstLabel.translatesAutoresizingMaskIntoConstraints = false

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
        for post in posts {
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
            label.font = UIFont(name: "Verdana", size: 8)
            label.text = post.name
            view.addSubview(label)
            label.translatesAutoresizingMaskIntoConstraints = false

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
