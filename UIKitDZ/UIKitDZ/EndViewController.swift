// EndViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// EndViewController
class EndViewController: UIViewController {
    private lazy var endButton: UIButton = {
        let button = UIButton()
        button.setTitle("Хорошо", for: .normal)
        button.addTarget(self, action: #selector(endButtonTapped), for: .touchUpInside)
        view.addSubview(button)
        button.backgroundColor = .systemCyan
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
    }

    func setupUI() {
        let image = createImageView(imageName: "end", in: view)
        let modLabel = createLabel(text: "спасибо\nза заказъ ", size: 30, font: "Verdana-Bold", color: .black, in: view)

        let priceLabel = createLabel(
            text: NSLocalizedString(
                [
                    "\nРазскажи о насъ другу, отправь ему",
                    "промокодъ",
                    "на безплатный напитокъ и получи",
                    "скидку 10% на слѣдующій заказъ."
                ].joined(), comment: "dc"
            ),
            size: 16,
            font: "Verdana",
            color: .systemGray,
            in: view
        )

        NSLayoutConstraint.activate([
            image.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            image.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            image.heightAnchor.constraint(equalToConstant: 86),
            image.widthAnchor.constraint(equalToConstant: 200),
            modLabel.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 40),
            modLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 100),
            modLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -100),
            priceLabel.topAnchor.constraint(equalTo: modLabel.bottomAnchor, constant: 50),
            priceLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            priceLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),

            endButton.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: 170),
            endButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            endButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
        ])
    }

    func createLabel(text: String, size: CGFloat, font: String, color: UIColor, in view: UIView) -> UILabel {
        let label = UILabel()
        label.text = text
        label.font = UIFont(name: font, size: size)
        label.textColor = color
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.textAlignment = .center
        view.addSubview(label)

        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }

    func createImageView(imageName: String, in view: UIView) -> UIImageView {
        let imageView = UIImageView(image: UIImage(named: imageName))
        view.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }

    @objc func endButtonTapped() {
        let vc = MainViewController()
        navigationController?.pushViewController(
            vc,
            animated: true
        )
        print("Ураааа")
    }
}
