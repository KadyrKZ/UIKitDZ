// DetailViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// DetailViewController
final class DetailViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        print("2 окно ")
    }

    // MARK: - IBAction

    @IBAction private func checkButton(_ sender: Any) {
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
    /*
     // MARK: - Navigation

     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         // Get the new view controller using segue.destination.
         // Pass the selected object to the new view controller.
     }
     */
}
