// DetailViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// DetailViewController  - контроллер авторизации пользователя
final class DetailViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }

    // MARK: - IBAction

    @IBAction private func checkedButton(_ sender: Any) {
        let alertController = UIAlertController(title: "Выставить счет? ", message: nil, preferredStyle: .alert)
        let action = UIAlertAction(title: "Чек", style: .default) { _ in
            guard let vc = UIStoryboard(name: "Main", bundle: Bundle.main)
                .instantiateViewController(withIdentifier: "CheckViewController") as? CheckViewController
            else { return }
            self.navigationController?.pushViewController(vc, animated: true)
        }
        let cancel = UIAlertAction(title: "cancel", style: .cancel) { _ in
        }
        alertController.addAction(action)
        alertController.addAction(cancel)
        alertController.preferredAction = action

        present(alertController, animated: true, completion: nil)
    }
}
