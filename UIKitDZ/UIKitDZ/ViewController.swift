// ViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// ViewController
class ViewController: UIViewController {
    lazy var guessButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 85, y: 302, width: 150, height: 150))
        button.setTitle("Угадай число", for: .normal)
        button.titleLabel?.font = UIFont(name: "Verdana-Bold", size: 20)
        button.titleLabel?.lineBreakMode = .byWordWrapping
        button.titleLabel?.textAlignment = .center
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = CGFloat(30)
        button.backgroundColor = .systemPurple
        button.layer.borderColor = .init(red: 76 / 255, green: 36 / 255, blue: 115 / 255, alpha: 1)
        button.addTarget(self, action: #selector(guessNumberButtonTapped), for: .touchUpInside)
        button.layer.borderWidth = 2
        return button
    }()

    lazy var calculateButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 140, y: 510, width: 200, height: 200))
        button.setTitle("Калькулятор", for: .normal)
        button.titleLabel?.font = UIFont(name: "Verdana-Bold", size: 20)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = CGFloat(30)
        button.backgroundColor = .green
        button.backgroundColor = .systemGreen
        button.layer.borderColor = .init(red: 59 / 255, green: 105 / 255, blue: 76 / 255, alpha: 1)
        button.layer.borderWidth = 2
        button.addTarget(self, action: #selector(additionButtonTapped), for: .touchUpInside)
        return button
    }()

    lazy var guessLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 48, width: Int(view.frame.width), height: 100))
        label.font = UIFont(name: "Verdana-Bold", size: 30)
        label.textAlignment = .center
        label.textColor = .white
        label.backgroundColor = UIColor(red: 151 / 255, green: 203 / 255, blue: 255 / 255, alpha: 1)
        label.layer.borderColor = CGColor(red: 255, green: 255, blue: 255, alpha: 1)
        label.layer.borderWidth = 2.0
        label.numberOfLines = 0
        label.isHidden = true
        return label
    }()

    lazy var backgroundImage: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height))
        imageView.image = UIImage(named: "Background")
        return imageView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        view.addSubview(backgroundImage)
        view.addSubview(guessButton)
        view.addSubview(calculateButton)
        view.addSubview(guessLabel)
        showAlert()
    }

    func showAlert() {
        let alertController = UIAlertController(
            title: "Пожалуйста, преставьтесь!",
            message: nil,
            preferredStyle: .alert
        )

        let action = UIAlertAction(title: "Ok", style: .default) { _ in
            if let text = alertController.textFields?.first?.text {
                self.guessLabel.text = "Приветcтвую,\n \(text.uppercased())!"
                self.guessLabel.isHidden = false
            }
        }

        view.backgroundColor = .systemGray6
        alertController.addTextField(configurationHandler: nil)
        alertController.addAction(action)
        alertController.preferredAction = action

        present(alertController, animated: true, completion: nil)
    }

    func showResultAlert(fNumber: String, sNumber: String) {
        guard let firstNumber = Int(fNumber), let secondNumber = Int(sNumber) else { return }
        let result = firstNumber + secondNumber

        let alertController = UIAlertController(
            title: "Ваш результат",
            message: "\(result)",
            preferredStyle: .alert
        )

        let action = UIAlertAction(title: "Ок", style: .default)
        let cancel = UIAlertAction(title: "Отмена", style: .cancel)

        alertController.addAction(cancel)
        alertController.addAction(action)
        alertController.preferredAction = action

        present(alertController, animated: true)
    }

    func showGuessAlert(number: String) {
        guard let firstNumber = Int(number) else { return }
        let result = Int.random(in: 0 ... 10)
        if result == firstNumber {
            let alertController = UIAlertController(
                title: "Поздравляю!",
                message: "Вы угадали",
                preferredStyle: .alert
            )

            let action = UIAlertAction(title: "Ок", style: .default)

            alertController.addAction(action)
            alertController.preferredAction = action

            present(alertController, animated: true)
        } else {
            let alertController = UIAlertController(
                title: "Упс!",
                message: "Это неверный ответ",
                preferredStyle: .alert
            )

            let action = UIAlertAction(title: "Ок", style: .default)
            alertController.addAction(action)
            alertController.preferredAction = action
            present(alertController, animated: true)
        }
    }

    @objc func additionButtonTapped() {
        let alertController = UIAlertController(
            title: "Введите ваши числа",
            message: nil,
            preferredStyle: .alert
        )

        let action = UIAlertAction(title: "Сложить", style: .default) { _ in
            let fNumber = alertController.textFields?.first?.text
            let sNumber = alertController.textFields?[1].text
            self.showResultAlert(fNumber: fNumber ?? "0", sNumber: sNumber ?? "0")
        }

        let cancel = UIAlertAction(title: "Отмена", style: .cancel) { _ in
        }

        alertController.addTextField(configurationHandler: nil)
        alertController.addTextField(configurationHandler: nil)

        alertController.addAction(action)
        alertController.addAction(cancel)
        alertController.preferredAction = action

        present(alertController, animated: true, completion: nil)
    }

    @objc func guessNumberButtonTapped() {
        let alertController = UIAlertController(
            title: "Угадай число от 1 до 10",
            message: nil,
            preferredStyle: .alert
        )

        let action = UIAlertAction(title: "Ok", style: .default) { _ in
            if let text = alertController.textFields?.first?.text {
                self.showGuessAlert(number: text)
            }
        }
        let cancel = UIAlertAction(title: "Отмена", style: .cancel) { _ in
        }

        view.backgroundColor = .systemGray6
        alertController.addTextField(configurationHandler: nil)
        alertController.addAction(cancel)
        alertController.addAction(action)

        alertController.preferredAction = action

        present(alertController, animated: true, completion: nil)
    }
}
