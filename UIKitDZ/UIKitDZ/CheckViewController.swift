// CheckViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// СheckViewController - контроллер для выдачи чека
final class CheckViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }

    // MARK: - IBAction

    @IBAction private func printedCheck(_ sender: Any) {
        let alertController = UIAlertController(title: "Вы хотите оплатить чек? ", message: nil, preferredStyle: .alert)
        let action = UIAlertAction(title: "Да", style: .default) { _ in
        }
        let cancel = UIAlertAction(title: "Отмена", style: .cancel) { _ in
        }
        alertController.addAction(action)
        alertController.addAction(cancel)
        alertController.preferredAction = action

        present(alertController, animated: true, completion: nil)
    }
}
