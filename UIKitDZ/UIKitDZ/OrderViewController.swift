// OrderViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// OrderViewController
final class OrderViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
    }

    private func setupUI() {
        let modLabel = createLabel(
            text: "Уточните обжарку зеренъ",
            size: 18,
            font: "Verdana-Bold",
            color: .black,
            in: view
        )

        let blockView = createBlockView(text: "Темная обжарка", color: .blockCoffee, height: 165)
        let addBlockView = createBlockView(text: "Свѣтлая обжарка", color: .blockCoffee, height: 165)

        NSLayoutConstraint.activate([
            modLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            modLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            modLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),

            blockView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            blockView.topAnchor.constraint(equalTo: modLabel.bottomAnchor, constant: 20),
            blockView.trailingAnchor.constraint(equalTo: addBlockView.leadingAnchor, constant: -15),

            addBlockView.leadingAnchor.constraint(equalTo: blockView.trailingAnchor, constant: 15),
            addBlockView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            addBlockView.topAnchor.constraint(equalTo: modLabel.bottomAnchor, constant: 20),
        ])
    }

    private func createBlockView(text: String, color: UIColor, height: CGFloat) -> UIView {
        let blockView = UIView()
        blockView.backgroundColor = color
        blockView.layer.cornerRadius = 12
        blockView.translatesAutoresizingMaskIntoConstraints = false

        let imageView = createImageView(imageName: "umage", in: blockView)
        let label = createLabel(text: text, size: 14, font: "Verdana", color: .black, in: blockView)
        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: blockView.centerXAnchor),
            imageView.topAnchor.constraint(equalTo: blockView.topAnchor, constant: 17),
            imageView.widthAnchor.constraint(equalToConstant: 100),
            imageView.heightAnchor.constraint(equalToConstant: 100),

            label.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 8),
            label.centerXAnchor.constraint(equalTo: blockView.centerXAnchor)
        ])
        view.addSubview(blockView)
        NSLayoutConstraint.activate([
            blockView.heightAnchor.constraint(equalToConstant: height),
            blockView.widthAnchor.constraint(equalToConstant: height),

        ])
        return blockView
    }

    private func createLabel(text: String, size: CGFloat, font: String, color: UIColor, in view: UIView) -> UILabel {
        let label = UILabel()
        label.text = text
        label.font = UIFont(name: font, size: size)
        label.textColor = color
        label.numberOfLines = 2
        view.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }

    private func createImageView(imageName: String, in view: UIView) -> UIImageView {
        let imageView = UIImageView(image: UIImage(named: imageName))
        view.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }

    @objc func orderButtonTapped() {
        let vc = OrderViewController()
        present(vc, animated: true, completion: nil)
    }
}
