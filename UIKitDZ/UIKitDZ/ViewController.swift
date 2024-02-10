// ViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// ViewController
final class ViewController: UIViewController {
    // MARK: - IBOutlet

    @IBOutlet private var passwordHideIcon: UIButton!
    @IBOutlet private var passwordTextfield: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        print("1 окно ")
    }

    // MARK: - IBAction

    @IBAction private func passwordHideButton(_ sender: Any) {
        passwordTextfield.isSecureTextEntry.toggle()
        if
            passwordTextfield.isSecureTextEntry
        {
            passwordHideIcon.setImage(UIImage(systemName: "eye.slash.fill"), for: .normal)
        } else {
            passwordHideIcon.setImage(UIImage(systemName: "eye.fill"), for: .normal)
        }
    }
}
