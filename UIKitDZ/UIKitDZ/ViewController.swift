// ViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// ViewController - главный экран гед можно перейти на разные реализации светофора
class ViewController: UIViewController {
    enum Constants {
        static let storyButtonLabel = "StoryBoard Realisation"
        static let stackButtonLabel = "StackView Realization"
        static let anchorButtonLabel = "Anchor Realisation"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    private func setupUI() {
        let storyBoardButton = makeButton(text: Constants.storyButtonLabel, method: #selector(clickedStoryBoardButton))
        let stackViewButton = makeButton(text: Constants.stackButtonLabel, method: #selector(clickedStackViewButton))
        let anchorButton = makeButton(text: Constants.anchorButtonLabel, method: #selector(clickedAnchorButton))

        NSLayoutConstraint.activate([
            storyBoardButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 280),
            stackViewButton.topAnchor.constraint(equalTo: storyBoardButton.bottomAnchor, constant: 30),
            anchorButton.topAnchor.constraint(equalTo: stackViewButton.bottomAnchor, constant: 30),
        ])
    }

    private func makeButton(text: String, method: Selector) -> UIButton {
        let button = UIButton()
        button.setTitle(text, for: .normal)
        button.backgroundColor = .magenta
        button.layer.cornerRadius = 10
        button.addTarget(self, action: method, for: .touchUpInside)
        view.addSubview(button)

        button.translatesAutoresizingMaskIntoConstraints = false
        button.widthAnchor.constraint(greaterThanOrEqualToConstant: 200).isActive = true
        button.heightAnchor.constraint(equalToConstant: 40).isActive = true
        button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true

        return button
    }

    @objc func clickedStoryBoardButton() {
        guard let nextViewController = UIStoryboard(name: "Main", bundle: .main)
            .instantiateViewController(withIdentifier: "StoryBoardViewController") as? StoryBoardViewController
        else { return }

        navigationController?.pushViewController(nextViewController, animated: true)
    }

    @objc func clickedStackViewButton() {
        let nextViewController = StackViewController()
        navigationController?.pushViewController(nextViewController, animated: true)
    }

    @objc func clickedAnchorButton() {
        let nextViewController = AnchorViewController()
        navigationController?.pushViewController(nextViewController, animated: true)
    }
}
