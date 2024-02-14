// ViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// ViewController - Логин страница для юзера
final class ViewController: UIViewController {
    // MARK: - IBOutlet

    @IBOutlet var emailField: UITextField!
    @IBOutlet var loginButton: UIButton!
    @IBOutlet private var passwordHideIcon: UIButton!
    @IBOutlet private var passwordTextfield: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        emailField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        passwordTextfield.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
    }

    // MARK: - IBAction

    @IBAction private func passwordHideButton(_ sender: Any) {
        passwordTextfield.isSecureTextEntry.toggle()
        if passwordTextfield.isSecureTextEntry {
            passwordHideIcon.setImage(UIImage(systemName: "eye.slash.fill"), for: .normal)
        } else {
            passwordHideIcon.setImage(UIImage(systemName: "eye.fill"), for: .normal)
        }
    }

    @objc private func textFieldDidChange(_ textField: UITextField) {
        // Проверяем, заполнены ли оба поля
        if let email = emailField.text, let password = passwordTextfield.text, !email.isEmpty, !password.isEmpty {
            loginButton.isEnabled = true
            loginButton.alpha = 1.0
        } else {
            loginButton.isEnabled = false
            loginButton.alpha = 0.5
        }
    }
}
