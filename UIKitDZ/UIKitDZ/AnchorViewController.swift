// AnchorViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// AnchorViewController - страница с реализацией анкеров
class AnchorViewController: UIViewController {
    // MARK: 
    let mainView = UIView()
    let redLightView = LightView()
    let yelloyLightView = LightView()
    let greenLightView = LightView()

    private var mainViewHeightConstraint: NSLayoutConstraint!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
//MARK: - При повороте смартфона
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)

        coordinator.animate(alongsideTransition: { [weak self] _ in
            guard let self = self else { return }

            let isPortrait = size.height > size.width

            if isPortrait {
                self.mainViewHeightConstraint.constant = 376
            } else {
                self.mainViewHeightConstraint.constant = 316
            }

            self.view.layoutIfNeeded()
        }, completion: nil)
    }
// Установка визуала
    private func setupUI() {
        mainView.backgroundColor = .black
        mainView.addSubview(redLightView)
        mainView.addSubview(yelloyLightView)
        mainView.addSubview(greenLightView)
        view.addSubview(mainView)

        redLightView.backgroundColor = .red
        yelloyLightView.backgroundColor = .yellow
        greenLightView.backgroundColor = .green

        mainView.translatesAutoresizingMaskIntoConstraints = false
        redLightView.translatesAutoresizingMaskIntoConstraints = false
        yelloyLightView.translatesAutoresizingMaskIntoConstraints = false
        greenLightView.translatesAutoresizingMaskIntoConstraints = false

        setupStackView()
    }
    // Все анкера
    func setupStackView() {
        mainView.leadingAnchor.constraint(greaterThanOrEqualTo: view.leadingAnchor, constant: 107).isActive = true
        mainView.trailingAnchor.constraint(lessThanOrEqualTo: view.trailingAnchor, constant: -108).isActive = true
        mainView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        mainView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true

        mainViewHeightConstraint = mainView.heightAnchor.constraint(equalToConstant: 376)
        mainViewHeightConstraint.isActive = true

        mainView.widthAnchor.constraint(equalTo: mainView.heightAnchor, multiplier: 0.43).isActive = true

        redLightView.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 15).isActive = true
        redLightView.heightAnchor.constraint(equalTo: yelloyLightView.widthAnchor).isActive = true
        redLightView.centerXAnchor.constraint(equalTo: yelloyLightView.centerXAnchor).isActive = true
        redLightView.widthAnchor.constraint(equalTo: yelloyLightView.widthAnchor).isActive = true

        yelloyLightView.topAnchor.constraint(equalTo: redLightView.bottomAnchor, constant: 8).isActive = true
        yelloyLightView.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 25).isActive = true
        yelloyLightView.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -25).isActive = true
        yelloyLightView.heightAnchor.constraint(equalTo: yelloyLightView.widthAnchor).isActive = true

        greenLightView.heightAnchor.constraint(equalTo: yelloyLightView.widthAnchor).isActive = true
        greenLightView.centerXAnchor.constraint(equalTo: yelloyLightView.centerXAnchor).isActive = true
        greenLightView.topAnchor.constraint(equalTo: yelloyLightView.bottomAnchor, constant: 8).isActive = true
        greenLightView.widthAnchor.constraint(equalTo: redLightView.widthAnchor).isActive = true
        greenLightView.bottomAnchor.constraint(equalTo: mainView.bottomAnchor, constant: -15).isActive = true
    }
}
