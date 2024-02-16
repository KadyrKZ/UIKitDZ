// CartViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// CartViewController
class CartViewController: UIViewController {
    var countDescLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
    var selectedSizeButton: UIButton?
    var itemCount = 1

    private lazy var saveButton: UIButton = {
        let button = UIButton()
        button.setTitle("Оформить заказ - 4250 ₽", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemPink
        button.layer.cornerRadius = 12
        button.addTarget(self, action: #selector(clickedSaveButton), for: .touchUpInside)
        view.addSubview(button)
        button.titleLabel?.font = UIFont(name: "Verdana-Bold", size: 16)
        button.translatesAutoresizingMaskIntoConstraints = false

        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
    }

    // MARK: Весь визуал в этом функции

    private func setupUI() {
        let myDataLabel = makeLabel(text: "Мои данные")

        let shoesBlock = createBlockView()
        let shoesImageBlock = createImageBlockView(view: shoesBlock)
        let shoesImage = createImage(image: "boots", view: shoesImageBlock)

        let bootsForWomenLabel = makeLabel1(text: "Женские ботинки", view: shoesBlock)
        let countLabel = makeLabel1(text: "Количество", view: shoesBlock)
        countDescLabel = makeLabel1(
            text: "1",
            view: shoesBlock
        ) // Инициализируем countDescLabel и сохраняем его в свойстве
        let sizeLabel = makeLabel1(text: "Размер", view: shoesBlock)
        let priceLabel = makeLabel1(text: "Цена", view: shoesBlock)
        let priceBootsLabel = makeLabel1(text: "4250 ₽", view: shoesBlock)

        // let cartImage = createImage(image: )
        let minusButton = createButton(text: "-", view: shoesBlock)
        let plusButton = createButton(text: "+", view: shoesBlock)

        minusButton.addTarget(self, action: #selector(clickedMinusButton), for: .touchUpInside)
        plusButton.addTarget(self, action: #selector(clickedPlusButton), for: .touchUpInside)

        let size35Button = createSizeButton(text: "35", view: shoesBlock)
        let size36Button = createSizeButton(text: "36", view: shoesBlock)
        let size37Button = createSizeButton(text: "37", view: shoesBlock)
        let size38Button = createSizeButton(text: "38", view: shoesBlock)
        let size39Button = createSizeButton(text: "39", view: shoesBlock)

        size35Button.addTarget(self, action: #selector(sizeButtonClicked(_:)), for: .touchUpInside)
        size36Button.addTarget(self, action: #selector(sizeButtonClicked(_:)), for: .touchUpInside)
        size37Button.addTarget(self, action: #selector(sizeButtonClicked(_:)), for: .touchUpInside)
        size38Button.addTarget(self, action: #selector(sizeButtonClicked(_:)), for: .touchUpInside)
        size39Button.addTarget(self, action: #selector(sizeButtonClicked(_:)), for: .touchUpInside)

        NSLayoutConstraint.activate([
            myDataLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            myDataLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            shoesBlock.topAnchor.constraint(equalTo: myDataLabel.bottomAnchor, constant: 20),
            shoesBlock.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            shoesBlock.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            shoesBlock.heightAnchor.constraint(equalToConstant: 157),

            shoesImageBlock.topAnchor.constraint(equalTo: myDataLabel.bottomAnchor, constant: 20),
            shoesImageBlock.leadingAnchor.constraint(equalTo: myDataLabel.leadingAnchor),
            shoesImageBlock.widthAnchor.constraint(equalToConstant: 157),
            shoesImageBlock.heightAnchor.constraint(equalToConstant: 157),

            shoesImage.leadingAnchor.constraint(equalTo: shoesBlock.leadingAnchor, constant: 28),
            shoesImage.centerYAnchor.constraint(equalTo: shoesBlock.centerYAnchor),
            shoesImage.heightAnchor.constraint(equalToConstant: 100),
            shoesImage.widthAnchor.constraint(equalToConstant: 100),

            bootsForWomenLabel.leadingAnchor.constraint(equalTo: shoesImageBlock.trailingAnchor, constant: 16),
            bootsForWomenLabel.topAnchor.constraint(equalTo: shoesBlock.topAnchor, constant: 18),

            countLabel.leadingAnchor.constraint(equalTo: shoesImageBlock.trailingAnchor, constant: 16),
            countLabel.topAnchor.constraint(equalTo: bootsForWomenLabel.bottomAnchor, constant: 12),

            minusButton.leadingAnchor.constraint(equalTo: countLabel.trailingAnchor, constant: 30),
            minusButton.topAnchor.constraint(equalTo: bootsForWomenLabel.bottomAnchor, constant: 14),

            plusButton.leadingAnchor.constraint(equalTo: countDescLabel.trailingAnchor, constant: 3),
            plusButton.topAnchor.constraint(equalTo: bootsForWomenLabel.bottomAnchor, constant: 14),

            countDescLabel.topAnchor.constraint(equalTo: bootsForWomenLabel.bottomAnchor, constant: 12),
            countDescLabel.leadingAnchor.constraint(equalTo: minusButton.trailingAnchor, constant: 3),

            sizeLabel.topAnchor.constraint(equalTo: countLabel.bottomAnchor, constant: 12),
            sizeLabel.leadingAnchor.constraint(equalTo: shoesImageBlock.trailingAnchor, constant: 16),

            size35Button.topAnchor.constraint(equalTo: sizeLabel.bottomAnchor, constant: 10),
            size35Button.leadingAnchor.constraint(equalTo: shoesImageBlock.trailingAnchor, constant: 22),

            size36Button.topAnchor.constraint(equalTo: sizeLabel.bottomAnchor, constant: 10),
            size36Button.leadingAnchor.constraint(equalTo: size35Button.trailingAnchor, constant: 4),

            size37Button.topAnchor.constraint(equalTo: sizeLabel.bottomAnchor, constant: 10),
            size37Button.leadingAnchor.constraint(equalTo: size36Button.trailingAnchor, constant: 4),

            size38Button.topAnchor.constraint(equalTo: sizeLabel.bottomAnchor, constant: 10),
            size38Button.leadingAnchor.constraint(equalTo: size37Button.trailingAnchor, constant: 4),

            size39Button.topAnchor.constraint(equalTo: size35Button.bottomAnchor, constant: 4),
            size39Button.leadingAnchor.constraint(equalTo: shoesImageBlock.trailingAnchor, constant: 22),

            priceLabel.topAnchor.constraint(equalTo: size39Button.bottomAnchor, constant: 7),
            priceLabel.leadingAnchor.constraint(equalTo: shoesImageBlock.trailingAnchor, constant: 16),

            priceBootsLabel.bottomAnchor.constraint(equalTo: shoesBlock.bottomAnchor, constant: -3),
            priceBootsLabel.trailingAnchor.constraint(equalTo: shoesBlock.trailingAnchor),

            saveButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100),
            saveButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            saveButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            saveButton.heightAnchor.constraint(equalToConstant: 44),

        ])
    }

    // MARK: Функции ддя создание элементов

    private func makeLabel(text: String) -> UILabel {
        let label = UILabel()
        label.text = text
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Verdana-Bold", size: 16)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.textColor = .black
        label.textAlignment = .center
        view.addSubview(label)
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20)
        ])
        return label
    }

    private func makeLabel1(text: String, view: UIView) -> UILabel {
        let label = UILabel()
        label.text = text
        label.font = UIFont(name: "Verdana", size: 12)
        label.textColor = .black
        view.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }

    private func createBlockView() -> UIView {
        let blockView = UIView()
        blockView.backgroundColor = .white
        blockView.layer.cornerRadius = 20
        view.addSubview(blockView)
        blockView.translatesAutoresizingMaskIntoConstraints = false
        return blockView
    }

    private func createImageBlockView(view: UIView) -> UIView {
        let blockView = UIView()
        blockView.backgroundColor = .systemGray6
        blockView.layer.cornerRadius = 20
        view.addSubview(blockView)
        blockView.translatesAutoresizingMaskIntoConstraints = false
        return blockView
    }

    private func createButton(text: String, view: UIView) -> UIButton {
        let button = UIButton()
        button.setTitle(text, for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = UIColor(named: "priceColor")
        button.layer.cornerRadius = 7.5
        view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            button.widthAnchor.constraint(equalToConstant: 15),
            button.heightAnchor.constraint(equalToConstant: 15)
        ])
        button.titleLabel?.font = UIFont(name: "Verdana", size: 10)
        return button
    }

    private func createSizeButton(text: String, view: UIView) -> UIButton {
        let button = UIButton()
        button.setTitle(text, for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = UIColor(named: "priceColor")
        button.layer.cornerRadius = 8.5
        view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            button.widthAnchor.constraint(equalToConstant: 31),
            button.heightAnchor.constraint(equalToConstant: 17)
        ])
        button.titleLabel?.font = UIFont(name: "Verdana", size: 10)
        return button
    }

    private func createImage(image: String, view: UIView) -> UIImageView {
        let imageView = UIImageView(image: UIImage(named: image))

        imageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(imageView)
        return imageView
    }

    // MARK: Оброботчики событие

    @objc func clickedSaveButton() {
        print("будущем будет)")
    }

    @objc func clickedMinusButton() {
        if itemCount > 1 {
            itemCount -= 1
            let countLabel = countDescLabel
            countLabel.text = "\(itemCount)"
        }
    }

    @objc func clickedPlusButton() {
        itemCount += 1
        let countLabel = countDescLabel
        countLabel.text = "\(itemCount)"
    }

    @objc func sizeButtonClicked(_ sender: UIButton) {
        selectedSizeButton?.layer.borderWidth = 0
        selectedSizeButton = sender
        selectedSizeButton?.layer.borderWidth = 1.5
        selectedSizeButton?.layer.borderColor = UIColor.red.cgColor
    }

    @objc func sizeButtonClicked() {}
}
