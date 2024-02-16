// ProfileViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// ProfileViewController
class ProfileViewController: UIViewController {
    var cardBlockView = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()

        let headerLabel = createLabel(text: "Каталог", color: .black, size: 18, font: "Verdana-Bold")

        cardBlockView = createBlockView(text: "15%", image: "r")

        let qrImage = createImage(image: "qr", view: cardBlockView)

        let discountLabel = createLabel(text: "1000 0001 0102", color: .white, size: 14, font: "Verdana")

        let myDataLabel = createLabel(text: "Личные данные", color: .black, size: 16, font: "Verdana-Bold")

        let myDataView = createItemList(text: "Мои данные", image: "myData")
        let myDataTapGesture = UITapGestureRecognizer(target: self, action: #selector(myDataTapped))
        myDataView.addGestureRecognizer(myDataTapGesture)
        myDataView.isUserInteractionEnabled = true

        let friendView = createItemList(text: "Приведи друга", image: "invideFriend")
        let feedBackView = createItemList(text: "Обратная связь", image: "feedback")

        NSLayoutConstraint.activate([
            headerLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            headerLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 9),

            cardBlockView.topAnchor.constraint(equalTo: headerLabel.bottomAnchor, constant: 20),
            cardBlockView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            cardBlockView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            cardBlockView.heightAnchor.constraint(equalToConstant: 180),

            qrImage.trailingAnchor.constraint(equalTo: cardBlockView.trailingAnchor, constant: -20),
            qrImage.topAnchor.constraint(equalTo: cardBlockView.topAnchor, constant: 20),
            qrImage.heightAnchor.constraint(equalToConstant: 15),
            qrImage.widthAnchor.constraint(equalToConstant: 15),

            discountLabel.leadingAnchor.constraint(equalTo: cardBlockView.leadingAnchor, constant: 14),
            discountLabel.bottomAnchor.constraint(equalTo: cardBlockView.bottomAnchor, constant: -20),

            myDataLabel.topAnchor.constraint(equalTo: cardBlockView.bottomAnchor, constant: 28),
            myDataLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),

            myDataView.topAnchor.constraint(equalTo: myDataLabel.bottomAnchor, constant: 20),
            myDataView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            myDataView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            myDataView.heightAnchor.constraint(equalToConstant: 35),

            friendView.topAnchor.constraint(equalTo: myDataView.bottomAnchor, constant: 20),
            friendView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            friendView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            friendView.heightAnchor.constraint(equalToConstant: 35),

            feedBackView.topAnchor.constraint(equalTo: friendView.bottomAnchor, constant: 20),
            feedBackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            feedBackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            feedBackView.heightAnchor.constraint(equalToConstant: 35),

        ])
    }

    private func createBlockView(text: String, image: String) -> UIView {
        let blockView = UIView()
        blockView.backgroundColor = .black
        blockView.layer.cornerRadius = 20
        view.addSubview(blockView)

        let label = createLabel(text: text, color: .white, size: 16, font: "Verdana-Bold")
        let image = createImage(image: image, view: blockView)

        NSLayoutConstraint.activate([
            image.topAnchor.constraint(equalTo: blockView.topAnchor, constant: 16),
            image.leadingAnchor.constraint(equalTo: blockView.leadingAnchor, constant: 8),
            image.heightAnchor.constraint(equalToConstant: 80),
            image.widthAnchor.constraint(equalToConstant: 80),

            label.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 20),
            label.leadingAnchor.constraint(equalTo: blockView.leadingAnchor, constant: 14),

        ])
        blockView.translatesAutoresizingMaskIntoConstraints = false
        return blockView
    }

    private func createItemList(text: String, image: String) -> UIView {
        let blockView = UIView()
        blockView.backgroundColor = .white
        view.addSubview(blockView)

        let label = createLabel(text: text, color: .black, size: 14, font: "Verdana")
        let image = createImage(image: image, view: blockView)

        NSLayoutConstraint.activate([
            image.centerYAnchor.constraint(equalTo: blockView.centerYAnchor),
            image.heightAnchor.constraint(equalToConstant: 20),
            image.widthAnchor.constraint(equalToConstant: 18),

            label.centerYAnchor.constraint(equalTo: blockView.centerYAnchor),
            label.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: 13),

        ])

        let lineView = UIView()
        lineView.backgroundColor = UIColor.lightGray.withAlphaComponent(0.5) // Adjust alpha as needed
        blockView.addSubview(lineView)

        lineView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            lineView.leadingAnchor.constraint(equalTo: blockView.leadingAnchor),
            lineView.trailingAnchor.constraint(equalTo: blockView.trailingAnchor),
            lineView.bottomAnchor.constraint(equalTo: blockView.bottomAnchor),
            lineView.heightAnchor.constraint(equalToConstant: 1) // Adjust height as needed
        ])
        blockView.translatesAutoresizingMaskIntoConstraints = false
        return blockView
    }

    private func createLabel(text: String, color: UIColor, size: CGFloat, font: String) -> UILabel {
        let label = UILabel()
        label.text = text
        label.textColor = color
        label.font = UIFont(name: font, size: size)
        label.textAlignment = .center
        view.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }

    private func createImage(image: String, view: UIView) -> UIImageView {
        let imageView = UIImageView(image: UIImage(named: image))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(imageView)
        return imageView
    }

    @objc func myDataTapped() {
        let myDataDetailsVC = DetailViewController() // Replace with your view controller
        navigationController?.pushViewController(myDataDetailsVC, animated: true)
    }
}
