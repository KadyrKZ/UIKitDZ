// DetailViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// DetailViewController
class DetailViewController: UIViewController {
    var loginView = UIView()

    private lazy var coffeeIcon: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "coffee"))
        loginView.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private lazy var orderButton: UIButton = {
        let button = UIButton()
        button.setTitle("Заказать", for: .normal)
        button.addTarget(self, action: #selector(orderButtonTapped), for: .touchUpInside)
        view.addSubview(button)
        button.backgroundColor = .systemCyan
        button.layer.cornerRadius = 15
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .brown
        setupUI()
    }

    func setupUI() {
        createView()
        let segmentedControl = UISegmentedControl(items: ["Американо", "Капучино", "Латте"])
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.addTarget(self, action: #selector(segmentedControlValueChanged(_:)), for: .valueChanged)
        view.addSubview(segmentedControl)
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false

        let modLabel = createLabel(text: "Модификация", size: 18, font: "Verdana-Bold", color: .black, in: view)

        let blockView = createBlockView(color: .systemGray, height: 165)

        let blockViewTapGesture = UITapGestureRecognizer(target: self, action: #selector(blockViewTapped))
        blockView.addGestureRecognizer(blockViewTapGesture)
        blockView.isUserInteractionEnabled = true

        let addBlockView = createBlockView(color: .systemGray, height: 165)

        let addBlockViewTapGesture = UITapGestureRecognizer(target: self, action: #selector(addBlockViewTapped))
        addBlockView.addGestureRecognizer(addBlockViewTapGesture)
        addBlockView.isUserInteractionEnabled = true
        let priceLabel = createLabel(
            text: "Цѣна - 100 руб",
            size: 18,
            font: "Verdana-Bold",
            color: .black,
            in: view
        )

        NSLayoutConstraint.activate([
            coffeeIcon.centerXAnchor.constraint(equalTo: loginView.centerXAnchor),
            coffeeIcon.topAnchor.constraint(equalTo: loginView.topAnchor, constant: 125),
            coffeeIcon.heightAnchor.constraint(equalToConstant: 150),
            coffeeIcon.widthAnchor.constraint(equalToConstant: 150),
            segmentedControl.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            segmentedControl.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            modLabel.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor, constant: 20),
            modLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            blockView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            blockView.topAnchor.constraint(equalTo: modLabel.bottomAnchor, constant: 20),
            blockView.trailingAnchor.constraint(equalTo: addBlockView.leadingAnchor, constant: -15),
            addBlockView.leadingAnchor.constraint(equalTo: blockView.trailingAnchor, constant: 15),
            addBlockView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            addBlockView.topAnchor.constraint(equalTo: modLabel.bottomAnchor, constant: 20),

            priceLabel.topAnchor.constraint(equalTo: addBlockView.bottomAnchor, constant: 20),
            priceLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),

            orderButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            orderButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            orderButton.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: 20),
            orderButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }

    func createView() {
        loginView.frame = CGRect(x: 0, y: 0, width: Int(view.bounds.width), height: 350)
        loginView.backgroundColor = .white
        loginView.layer.cornerRadius = 20
        view.addSubview(loginView)
    }

    func createBlockView(color: UIColor, height: CGFloat) -> UIView {
        let blockView = UIView()
        blockView.backgroundColor = color
        blockView.layer.cornerRadius = 10
        blockView.translatesAutoresizingMaskIntoConstraints = false

        let imageView = createImageView(imageName: "coffee", in: blockView)
        let label = createLabel(text: "coffee", size: 16, font: "Verdana", color: .white, in: blockView)
        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: blockView.centerXAnchor),
            imageView.topAnchor.constraint(equalTo: blockView.topAnchor, constant: 20),
            imageView.widthAnchor.constraint(equalToConstant: 80),
            imageView.heightAnchor.constraint(equalToConstant: 80),

            label.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 10),
            label.centerXAnchor.constraint(equalTo: blockView.centerXAnchor)
        ])
        view.addSubview(blockView)
        NSLayoutConstraint.activate([
            blockView.heightAnchor.constraint(equalToConstant: height),
            blockView.widthAnchor.constraint(equalToConstant: height),

        ])
        return blockView
    }

    func createLabel(text: String, size: CGFloat, font: String, color: UIColor, in view: UIView) -> UILabel {
        let label = UILabel()
        label.text = text
        label.font = UIFont(name: font, size: size)
        label.textColor = color
        label.numberOfLines = 2
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

    @objc func segmentedControlValueChanged(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            coffeeIcon.image = UIImage(named: "coffee")
        case 1:
            coffeeIcon.image = UIImage(named: "cop2")
        case 2:
            coffeeIcon.image = UIImage(named: "cop3")
        default:
            break
        }
    }

    @objc func orderButtonTapped() {
        let vc = EndViewController()
        navigationController?.pushViewController(
            vc,
            animated: true
        )
    }

    @objc func addBlockViewTapped() {
        let vc = AddBlockViewController()
        present(vc, animated: true, completion: nil)
    }

    @objc func blockViewTapped() {
        let vc = OrderViewController()
        present(vc, animated: true, completion: nil)
    }
}
