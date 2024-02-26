// StackViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// StackViewController
class StackViewController: UIViewController {
    let mainView = UIView()
    private var stackView = UIStackView()
    let redLightView = LightView()
    let yelloyLightView = LightView()
    let greenLightView = LightView()

    private var mainViewHeightConstraint: NSLayoutConstraint!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

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

    private func setupUI() {
        stackView = UIStackView(arrangedSubviews: [redLightView, yelloyLightView, greenLightView])
        mainView.backgroundColor = .black

        view.addSubview(mainView)

        mainView.addSubview(stackView)
        redLightView.backgroundColor = .red
        yelloyLightView.backgroundColor = .yellow
        greenLightView.backgroundColor = .green
        stackView.backgroundColor = .black

        mainView.translatesAutoresizingMaskIntoConstraints = false
        stackView.translatesAutoresizingMaskIntoConstraints = false
        redLightView.translatesAutoresizingMaskIntoConstraints = false
        yelloyLightView.translatesAutoresizingMaskIntoConstraints = false
        greenLightView.translatesAutoresizingMaskIntoConstraints = false

        setupStackView()
    }

    func setupStackView() {
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.distribution = .fillEqually

        stackView.translatesAutoresizingMaskIntoConstraints = false

        mainView.leadingAnchor.constraint(greaterThanOrEqualTo: view.leadingAnchor, constant: 108).isActive = true
        mainView.trailingAnchor.constraint(lessThanOrEqualTo: view.trailingAnchor, constant: -108).isActive = true
        mainView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        mainView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true

        mainViewHeightConstraint = mainView.heightAnchor.constraint(equalToConstant: 376)
        mainViewHeightConstraint.isActive = true

        mainView.widthAnchor.constraint(equalTo: mainView.heightAnchor, multiplier: 0.44).isActive = true

        stackView.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 25).isActive = true
        stackView.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -25).isActive = true
        stackView.centerYAnchor.constraint(equalTo: mainView.centerYAnchor).isActive = true
        stackView.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 15).isActive = true
        stackView.bottomAnchor.constraint(equalTo: mainView.bottomAnchor, constant: -15).isActive = true
    }
}
