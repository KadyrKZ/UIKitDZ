// AddBlockViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// AddBlockViewController
class AddBlockViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
    }

    func setupUI() {
        let modLabel = createLabel(
            text: "Выберите дополнительные\nингредіенты",
            size: 18,
            font: "Verdana-Bold",
            in: view
        )

        let milkLabel = createLabel(text: "Молоко", size: 18, font: "Verdana", in: view)
        let milkSwitch = createSwitch(in: view)

        let sidelLabel = createLabel(text: "Сироп", size: 18, font: "Verdana", in: view)
        let sidelSwitch = createSwitch(in: view)

        let milkSidelLabel = createLabel(text: "Молоко соевое", size: 18, font: "Verdana", in: view)
        let milkSidelSwitch = createSwitch(in: view)

        let milkDimalLabel = createLabel(text: "Молоко миндальное", size: 18, font: "Verdana", in: view)
        let milkDimalSwitch = createSwitch(in: view)

        let espressoLabel = createLabel(text: "Экспрессо", size: 18, font: "Verdana", in: view)
        let espressoSwitch = createSwitch(in: view)

        NSLayoutConstraint.activate([
            modLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            modLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),

            milkLabel.topAnchor.constraint(equalTo: modLabel.bottomAnchor, constant: 30),
            milkLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            milkSwitch.centerYAnchor.constraint(equalTo: milkLabel.centerYAnchor),
            milkSwitch.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),

            sidelLabel.topAnchor.constraint(equalTo: milkLabel.bottomAnchor, constant: 20),
            sidelLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            sidelSwitch.centerYAnchor.constraint(equalTo: sidelLabel.centerYAnchor),
            sidelSwitch.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),

            milkSidelLabel.topAnchor.constraint(equalTo: sidelLabel.bottomAnchor, constant: 20),
            milkSidelLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            milkSidelSwitch.centerYAnchor.constraint(equalTo: milkSidelLabel.centerYAnchor),
            milkSidelSwitch.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),

            milkDimalLabel.topAnchor.constraint(equalTo: milkSidelLabel.bottomAnchor, constant: 20),
            milkDimalLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            milkDimalSwitch.centerYAnchor.constraint(equalTo: milkDimalLabel.centerYAnchor),
            milkDimalSwitch.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),

            espressoLabel.topAnchor.constraint(equalTo: milkDimalLabel.bottomAnchor, constant: 20),
            espressoLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            espressoSwitch.centerYAnchor.constraint(equalTo: espressoLabel.centerYAnchor),
            espressoSwitch.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
        ])
    }

    func createLabel(text: String, size: CGFloat, font: String, in view: UIView) -> UILabel {
        let label = UILabel()
        label.text = text
        label.font = UIFont(name: font, size: size)
        label.textColor = .black
        label.numberOfLines = 2
        view.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }

    func createSwitch(in view: UIView) -> UISwitch {
        let switchControl = UISwitch()
        view.addSubview(switchControl)
        switchControl.translatesAutoresizingMaskIntoConstraints = false
        return switchControl
    }
}
