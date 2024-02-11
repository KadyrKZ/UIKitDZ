// ViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// ViewController
class ViewController: UIViewController {
    lazy var cakeImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Image")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.frame = CGRect(origin: .zero, size: CGSize(width: 125, height: 125))
        return imageView
    }()

    lazy var emailField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.placeholder = "typing email"
        textField.font = .systemFont(ofSize: 14)
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()

    lazy var passField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.placeholder = "typing password"
        textField.font = .systemFont(ofSize: 14)
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.isSecureTextEntry = true
        return textField
    }()

    lazy var showHideButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "eye.slash"), for: .normal)
        button.tintColor = .systemGray
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(togglePasswordVisibility), for: .touchUpInside)
        return button
    }()

    lazy var loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("Login", for: .normal)
        button.backgroundColor = .systemRed
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 5
        button.addTarget(self, action: #selector(loginButtonClick), for: .touchUpInside)
        return button
    }()

    lazy var faceSwitch: UISwitch = {
        let faceSwitch = UISwitch()
        faceSwitch.translatesAutoresizingMaskIntoConstraints = false
        return faceSwitch
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    private func setupUI() {
        let loginLabel = makeLabel(
            text: "Birthday Reminder",
            size: 18,
            color: .systemIndigo
        )

        let signLabel = makeLabel(
            text: "Sign in",
            size: 26,
            color: .systemRed
        )

        let emailLabel = makeLabel(
            text: "Email",
            size: 16,
            color: .systemRed
        )

        let passwordLabel = makeLabel(
            text: "Password",
            size: 16,
            color: .systemRed
        )

        let faceIDLabel = makeLabel(text: "Use faceID", size: 14, color: .black)

        view.addSubview(loginLabel)
        view.addSubview(signLabel)
        view.addSubview(passwordLabel)
        view.addSubview(emailLabel)
        view.addSubview(emailField)
        view.addSubview(passField)
        view.addSubview(loginButton)
        view.addSubview(cakeImage)
        view.addSubview(showHideButton)
        view.addSubview(faceIDLabel)
        view.addSubview(faceSwitch)

        NSLayoutConstraint.activate([
            cakeImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            cakeImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 60),
            cakeImage.widthAnchor.constraint(equalToConstant: 125),
            cakeImage.heightAnchor.constraint(equalToConstant: 125),
            loginLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginLabel.topAnchor.constraint(equalTo: cakeImage.bottomAnchor, constant: 10),
            loginLabel.widthAnchor.constraint(equalToConstant: 175),
            signLabel.topAnchor.constraint(equalTo: loginLabel.bottomAnchor, constant: 20),
            signLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            emailLabel.topAnchor.constraint(equalTo: signLabel.bottomAnchor, constant: 16),
            emailLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            passwordLabel.topAnchor.constraint(equalTo: emailField.bottomAnchor, constant: 16),
            passwordLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            emailField.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 20),
            emailField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            emailField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            passField.topAnchor.constraint(equalTo: passwordLabel.bottomAnchor, constant: 10),
            passField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            passField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            showHideButton.centerYAnchor.constraint(equalTo: passField.centerYAnchor),
            showHideButton.trailingAnchor.constraint(equalTo: passField.trailingAnchor, constant: -10),
            showHideButton.widthAnchor.constraint(equalToConstant: 30),
            showHideButton.heightAnchor.constraint(equalToConstant: 30),
            loginButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -80),
            loginButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            loginButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            faceIDLabel.topAnchor.constraint(equalTo: passField.bottomAnchor, constant: 90),
            faceIDLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 120),
            faceSwitch.centerYAnchor.constraint(equalTo: faceIDLabel.centerYAnchor),
            faceSwitch.leadingAnchor.constraint(equalTo: faceIDLabel.trailingAnchor, constant: 20),
        ])
    }

    func makeLabel(text: String, size: CGFloat, color: UIColor) -> UILabel {
        let label = UILabel()
        label.text = text
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Verdana-Bold", size: size)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.textColor = color
        label.textAlignment = .center
        return label
    }

    @objc func loginButtonClick() {
        let vc = ReminderViewController()
        navigationController?.pushViewController(vc, animated: true)
    }

    @objc func togglePasswordVisibility() {
        passField.isSecureTextEntry.toggle()
        let imageName = passField.isSecureTextEntry ? "eye.slash" : "eye"
        showHideButton.setImage(UIImage(systemName: imageName), for: .normal)
    }
}
