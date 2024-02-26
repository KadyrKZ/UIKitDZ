// MainViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// MainViewController - главный экран гед можно перейти на разные реализации светофора
final class MainViewController: UIViewController {
    enum Constants {
        static let storyButtonLabel = "StoryBoard Realisation"
        static let stackButtonLabel = "StackView Realization"
        static let anchorButtonLabel = "Anchor Realisation"
    }

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    private func setupUI() {
        let storyBoardButton = makeButton(text: Constants.storyButtonLabel, tag: 0)
        let stackViewButton = makeButton(text: Constants.stackButtonLabel, tag: 1)
        let anchorButton = makeButton(text: Constants.anchorButtonLabel, tag: 2)
        NSLayoutConstraint.activate([
            storyBoardButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 280),
            stackViewButton.topAnchor.constraint(equalTo: storyBoardButton.bottomAnchor, constant: 30),
            anchorButton.topAnchor.constraint(equalTo: stackViewButton.bottomAnchor, constant: 30),
        ])
    }

    private func makeButton(text: String, tag: Int) -> UIButton {
        let button = UIButton()
        button.setTitle(text, for: .normal)
        button.backgroundColor = .magenta
        button.layer.cornerRadius = 10
        button.tag = tag
        button.addTarget(self, action: #selector(menuListButtonTapped(_:)), for: .touchUpInside)
        view.addSubview(button)

        button.translatesAutoresizingMaskIntoConstraints = false
        button.widthAnchor.constraint(greaterThanOrEqualToConstant: 200).isActive = true
        button.heightAnchor.constraint(equalToConstant: 40).isActive = true
        button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true

        return button
    }

    @objc private func menuListButtonTapped(_ sender: UIButton) {
        var controllerToPresent = UIViewController()
        switch sender.tag {
        case 0:
            guard let nextViewController = UIStoryboard(name: "Main", bundle: .main)
                .instantiateViewController(withIdentifier: "StoryBoardViewController") as? StoryBoardViewController
            else { return }
            controllerToPresent = nextViewController
        case 1:
            controllerToPresent = StackViewController()
        case 2:
            controllerToPresent = AnchorViewController()
        default:
            break
        }
        navigationController?.pushViewController(controllerToPresent, animated: true)
    }
}
