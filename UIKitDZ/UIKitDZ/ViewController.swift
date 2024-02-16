// ViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// ViewController - глайный контроллер для каталога товаров
class ViewController: UIViewController {
    let personArray = ["Женщинам", "Мужчинам", "Детям"]
    var personSegment = UISegmentedControl()
    var newSnickersImage = UIImageView()
    var saleSnickersImage = UIImageView()
    var brendBlockView = UIView()
    var shoesBlockView = UIView()
    var bagBlockView = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()

        let headerLabel = createLabel(text: "Каталог", color: .black, size: 18)
        personSegment = createSegment()
        personSegment.selectedSegmentIndex = 1
        newSnickersImage = createImage(image: "newSnickers")
        let newSnickersLabel = createLabel(text: "Новинки", color: .white, size: 16)

        saleSnickersImage = createImage(image: "saleSnickers")
        let saleSnickersLabel = createLabel(text: "Распродажа", color: .white, size: 16)

        brendBlockView = createBlockView(text: "Бренды", image: "brands")
        shoesBlockView = createBlockView(text: "Обувь", image: "shoes")
        bagBlockView = createBlockView(text: "Сумки", image: "bag")

        NSLayoutConstraint.activate([
            headerLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            headerLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 9),

            personSegment.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            personSegment.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            personSegment.topAnchor.constraint(equalTo: headerLabel.bottomAnchor, constant: 25),

            newSnickersImage.topAnchor.constraint(equalTo: personSegment.bottomAnchor, constant: 20),
            newSnickersImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            newSnickersImage.heightAnchor.constraint(equalToConstant: 120),
            newSnickersImage.widthAnchor.constraint(equalToConstant: 160),

            newSnickersLabel.centerXAnchor.constraint(equalTo: newSnickersImage.centerXAnchor),
            newSnickersLabel.topAnchor.constraint(equalTo: newSnickersImage.topAnchor, constant: 2),

            saleSnickersImage.topAnchor.constraint(equalTo: personSegment.bottomAnchor, constant: 20),
            saleSnickersImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            saleSnickersImage.heightAnchor.constraint(equalToConstant: 120),
            saleSnickersImage.widthAnchor.constraint(equalToConstant: 160),

            saleSnickersLabel.centerXAnchor.constraint(equalTo: saleSnickersImage.centerXAnchor),
            saleSnickersLabel.bottomAnchor.constraint(equalTo: saleSnickersImage.bottomAnchor, constant: -2),

            brendBlockView.topAnchor.constraint(equalTo: saleSnickersImage.bottomAnchor, constant: 20),
            brendBlockView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            brendBlockView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            brendBlockView.heightAnchor.constraint(equalToConstant: 80),

            shoesBlockView.topAnchor.constraint(equalTo: brendBlockView.bottomAnchor, constant: 20),
            shoesBlockView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            shoesBlockView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            shoesBlockView.heightAnchor.constraint(equalToConstant: 80),

            bagBlockView.topAnchor.constraint(equalTo: shoesBlockView.bottomAnchor, constant: 20),
            bagBlockView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            bagBlockView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            bagBlockView.heightAnchor.constraint(equalToConstant: 80),
        ])
    }

    private func createBlockView(text: String, image: String) -> UIView {
        let blockView = UIView()
        blockView.backgroundColor = .systemGray6
        blockView.layer.cornerRadius = 12
        view.addSubview(blockView)
        let label = createLabel(text: text, color: .black, size: 16)
        let image = createImage(image: image)
        NSLayoutConstraint.activate([
            label.centerYAnchor.constraint(equalTo: blockView.centerYAnchor),
            label.leadingAnchor.constraint(equalTo: blockView.leadingAnchor, constant: 25),

            image.centerYAnchor.constraint(equalTo: blockView.centerYAnchor),
            image.trailingAnchor.constraint(equalTo: blockView.trailingAnchor),
            image.heightAnchor.constraint(equalToConstant: 80),
            image.widthAnchor.constraint(equalToConstant: 100)
        ])
        blockView.translatesAutoresizingMaskIntoConstraints = false
        return blockView
    }

    private func createLabel(text: String, color: UIColor, size: CGFloat) -> UILabel {
        let label = UILabel()
        label.text = text
        label.textColor = color
        label.font = UIFont(name: "Verdana-Bold", size: size)
        label.textAlignment = .center
        view.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }

    private func createSegment() -> UISegmentedControl {
        let segment = UISegmentedControl(items: personArray)
        segment.addTarget(self, action: #selector(changedSegmentValue), for: .valueChanged)
        view.addSubview(segment)
        segment.translatesAutoresizingMaskIntoConstraints = false
        return segment
    }

    private func createImage(image: String) -> UIImageView {
        let imageView = UIImageView(image: UIImage(named: image))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(imageView)
        return imageView
    }

    @objc func changedSegmentValue() {
        let selectedIndex = personSegment.selectedSegmentIndex

        // Обновить изображения в зависимости от выбранного сегмента
        switch selectedIndex {
        case 0:
            newSnickersImage.image = UIImage(named: "bag")
            saleSnickersImage.image = UIImage(named: "bag")

        case 1:
            newSnickersImage.image = UIImage(named: "newSnickers")
            saleSnickersImage.image = UIImage(named: "saleSnickers")
        case 2:
            newSnickersImage.image = UIImage(named: "bag")
            saleSnickersImage.image = UIImage(named: "bag")

            bagBlockView.largeContentImage = .checkmark
        default:
            break
        }
    }
}
