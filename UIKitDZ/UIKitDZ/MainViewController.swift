// MainViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// MainViewController - основной контроллер для приветствие
final class MainViewController: UIViewController {
    /// Приватные экземпляры для полей
    private let loginView = UIView()
    private let loginField = UITextField()
    private let passField = UITextField()
    private var isPasswordVisible = false
    var presentingNavController: UINavigationController!

    private lazy var headerIcon: UIImageView = {
        let imageView = UIImageView(image: .header)
        view.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private lazy var hiLabel: UILabel = {
        let label = UILabel()
        label.text = "Добро пожаловать,\nГость"
        label.font = UIFont(name: "Verdana-Bold", size: 16)
        label.textColor = .white
        label.numberOfLines = 2
        view.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20)
        ])
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .backgroundBroun
        setupUI()
    }

    private func setupUI() {
        createView()
        let adressView = createBlockView(color: .blockBlue, height: 70)
        let pizogView = createBlockView(color: .blockBroun, height: 80)
        let napitokView = createBlockView(color: .blockBroun, height: 80)
        let coffeeView = createBlockView(color: .blockBroun, height: 80)
        let coffeeViewTapGesture = UITapGestureRecognizer(target: self, action: #selector(handleCoffeeViewTap))
        coffeeView.addGestureRecognizer(coffeeViewTapGesture)
        coffeeView.isUserInteractionEnabled = true
        let adressLabel = createLabel(
            text: "Адреса кофеен",
            size: 12,
            isBold: true,
            isItalic: false,
            in: adressView
        )
        let adressDescriptLabel = createLabel(
            text: "Разрѣшите доступъ къ ​геолокаціи для\nпоиска ближайшей кофейни ",
            size: 12,
            isBold: false,
            isItalic: false,
            in: adressView
        )
        adressDescriptLabel.textColor = .systemGray2
        let pirokLabel = createLabel(
            text: "Пти пате аля «РюсЪ»",
            size: 16,
            isBold: true,
            isItalic: true,
            in: pizogView
        )
        let napitokLabel = createLabel(
            text: "Горячiя напитки",
            size: 16,
            isBold: true,
            isItalic: true,
            in: napitokView
        )
        let coffeeLabel = createLabel(
            text: "Кофий",
            size: 16,
            isBold: true,
            isItalic: true,
            in: coffeeView
        )
        let menuIcon = createImageView(imageName: "menu", in: loginView)
        let uzorIcon = createImageView(imageName: "tracery", in: loginView)

        NSLayoutConstraint.activate([
            headerIcon.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 100),
            headerIcon.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -100),
            headerIcon.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            headerIcon.heightAnchor.constraint(equalToConstant: 55),

            hiLabel.topAnchor.constraint(equalTo: headerIcon.bottomAnchor, constant: 22),

            adressView.topAnchor.constraint(equalTo: loginView.topAnchor, constant: 40),
            adressLabel.topAnchor.constraint(equalTo: adressView.topAnchor, constant: 12),
            adressLabel.leadingAnchor.constraint(equalTo: adressView.leadingAnchor, constant: 15),
            adressLabel.topAnchor.constraint(equalTo: adressView.topAnchor, constant: 12),

            adressDescriptLabel.topAnchor.constraint(equalTo: adressLabel.bottomAnchor, constant: 3),
            adressDescriptLabel.leadingAnchor.constraint(equalTo: adressView.leadingAnchor, constant: 15),
            menuIcon.topAnchor.constraint(equalTo: adressView.bottomAnchor, constant: 20),
            menuIcon.leadingAnchor.constraint(equalTo: loginView.leadingAnchor, constant: 160),
            menuIcon.trailingAnchor.constraint(equalTo: loginView.trailingAnchor, constant: -160),
            menuIcon.heightAnchor.constraint(equalToConstant: 20),

            uzorIcon.topAnchor.constraint(equalTo: menuIcon.bottomAnchor, constant: 10),
            uzorIcon.leadingAnchor.constraint(equalTo: loginView.leadingAnchor, constant: 137),
            uzorIcon.trailingAnchor.constraint(equalTo: loginView.trailingAnchor, constant: -137),
            uzorIcon.heightAnchor.constraint(equalToConstant: 40),

            pizogView.topAnchor.constraint(equalTo: uzorIcon.bottomAnchor, constant: 20),
            napitokView.topAnchor.constraint(equalTo: pizogView.bottomAnchor, constant: 20),
            coffeeView.topAnchor.constraint(equalTo: napitokView.bottomAnchor, constant: 20),

            pirokLabel.topAnchor.constraint(equalTo: pizogView.topAnchor, constant: 30),
            pirokLabel.leadingAnchor.constraint(equalTo: pizogView.leadingAnchor, constant: 25),

            napitokLabel.topAnchor.constraint(equalTo: napitokView.topAnchor, constant: 30),
            napitokLabel.leadingAnchor.constraint(equalTo: napitokView.leadingAnchor, constant: 25),

            coffeeLabel.leadingAnchor.constraint(equalTo: coffeeView.leadingAnchor, constant: 25),
            coffeeLabel.topAnchor.constraint(equalTo: coffeeView.topAnchor, constant: 30),
        ])
    }

    private func createView() {
        loginView.frame = CGRect(x: 0, y: 230, width: Int(view.bounds.width), height: 580)
        loginView.backgroundColor = .white
        loginView.layer.cornerRadius = 20
        view.addSubview(loginView)
    }

    private func createBlockView(color: UIColor, height: CGFloat) -> UIView {
        let blockView = UIView()
        blockView.backgroundColor = color
        blockView.layer.cornerRadius = 15
        blockView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(blockView)
        NSLayoutConstraint.activate([
            blockView.leadingAnchor.constraint(equalTo: loginView.leadingAnchor, constant: 20),
            blockView.trailingAnchor.constraint(equalTo: loginView.trailingAnchor, constant: -20),
            blockView.heightAnchor.constraint(equalToConstant: height),
        ])
        return blockView
    }

    private func createLabel(text: String, size: CGFloat, isBold: Bool, isItalic: Bool, in view: UIView) -> UILabel {
        let label = UILabel()
        label.text = text
        var fontDescriptor = UIFontDescriptor()
        var symbolicTraits: UIFontDescriptor.SymbolicTraits = []
        
        if isBold {
            symbolicTraits.insert(.traitBold)
        }
        if isItalic {
            symbolicTraits.insert(.traitItalic)
        }

        fontDescriptor = fontDescriptor.withSymbolicTraits(symbolicTraits) ?? fontDescriptor
        let font = UIFont(descriptor: fontDescriptor, size: size)

        label.font = font
        label.textColor = .black
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

    @objc func handleCoffeeViewTap() {
        let vc = DetailViewController()
        presentingNavController?.pushViewController(vc, animated: true)
        dismiss(animated: false)
    }
}
