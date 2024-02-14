// ViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// ViewController

final class ViewController: UIViewController {
    var loginView = UIView()
    var loginField = UITextField()
    var passField = UITextField()
    var isPasswordVisible = false

    private lazy var headerIcon: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "Image"))
        view.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private lazy var eyeIcon: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "eye.slash"), for: .normal)
        button.addTarget(self, action: #selector(clickEyeButton), for: .touchUpInside)
        loginView.addSubview(button)
        button.tintColor = .systemGray2
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private lazy var loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("Войти", for: .normal)
        button.addTarget(self, action: #selector(textFieldDidChange), for: .touchUpInside)
        button.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        loginView.addSubview(button)
        button.backgroundColor = .systemGray
        button.translatesAutoresizingMaskIntoConstraints = false
        button.isEnabled = false
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .brown
        loginView.frame = CGRect(x: 0, y: 230, width: Int(view.bounds.width), height: 582)
        loginView.backgroundColor = .white
        loginView.layer.cornerRadius = 20
        view.addSubview(loginView)

        setupUI()
    }

    func setupUI() {
        let signUpLabel = createLabel(text: "Авторизация", size: 26)
        let loginLabel = createLabel(text: "Логин", size: 16)
        let passLabel = createLabel(text: "Пароль", size: 16)
        loginField = createTextField(text: "Введи почту")
        passField = createTextField(text: "Введи пароль")
        passField.isSecureTextEntry = true

        NSLayoutConstraint.activate([
            headerIcon.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 100),
            headerIcon.trailingAnchor.constraint(equalTo: loginView.trailingAnchor, constant: -100),
            headerIcon.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            headerIcon.heightAnchor.constraint(equalToConstant: 55),
            signUpLabel.topAnchor.constraint(equalTo: loginView.topAnchor, constant: 20),
            loginLabel.topAnchor.constraint(equalTo: signUpLabel.bottomAnchor, constant: 20),
            loginField.topAnchor.constraint(equalTo: loginLabel.bottomAnchor, constant: 10),
            passLabel.topAnchor.constraint(equalTo: loginField.bottomAnchor, constant: 20),
            passField.topAnchor.constraint(equalTo: passLabel.bottomAnchor, constant: 10),
            eyeIcon.centerYAnchor.constraint(equalTo: passField.centerYAnchor),
            eyeIcon.trailingAnchor.constraint(equalTo: passField.trailingAnchor, constant: -10),
            loginButton.leadingAnchor.constraint(equalTo: loginView.leadingAnchor, constant: 20),
            loginButton.trailingAnchor.constraint(equalTo: loginView.trailingAnchor, constant: -20),
            loginButton.topAnchor.constraint(equalTo: passField.bottomAnchor, constant: 20),
            loginButton.heightAnchor.constraint(equalToConstant: 44)
        ])

        loginField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        passField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
    }

    func createLabel(text: String, size: CGFloat) -> UILabel {
        let label = UILabel()
        label.text = text
        label.font = UIFont(name: "Verdana-Bold", size: size)
        label.textColor = .black
        loginView.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: loginView.leadingAnchor, constant: 20)
        ])
        return label
    }

    func createTextField(text: String) -> UITextField {
        let textField = UITextField()
        textField.placeholder = text
        textField.font = UIFont(name: "Verdana", size: 16)
        textField.textColor = .black
        loginView.addSubview(textField)
        textField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            textField.leadingAnchor.constraint(equalTo: loginView.leadingAnchor, constant: 20),
            textField.trailingAnchor.constraint(equalTo: loginView.trailingAnchor, constant: -20)
        ])
        return textField
    }

    @objc func clickEyeButton() {
        isPasswordVisible.toggle()
        let imageName = isPasswordVisible ? "eye" : "eye.slash"
        eyeIcon.setImage(UIImage(systemName: imageName), for: .normal)
        passField.isSecureTextEntry = !isPasswordVisible
    }

    func checkFields() -> Bool {
        guard let loginText = loginField.text, let passText = passField.text else {
            return false
        }
        return !loginText.isEmpty && !passText.isEmpty
    }

    @objc func textFieldDidChange(_ textField: UITextField) {
        loginButton.isEnabled = checkFields()
        if loginButton.isEnabled {
            loginButton.backgroundColor = .green
        } else {
            loginButton.backgroundColor = .systemGray
        }
    }

    @objc func loginButtonTapped() {
        let vc = MainViewController()
        present(vc, animated: true, completion: nil)
    }
}
