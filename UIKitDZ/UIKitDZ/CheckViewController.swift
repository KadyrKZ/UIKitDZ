// CheckViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// checkViewController
final class CheckViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        print("3 окно")
    }

    // MARK: - IBAction

    @IBAction private func printCheck(_ sender: Any) {
        let alertController = UIAlertController(title: "Вы хотите оплатить чек? ", message: nil, preferredStyle: .alert)
        let action = UIAlertAction(title: "Да", style: .default) { _ in
            guard let vc = UIStoryboard(name: "Main", bundle: Bundle.main)
                .instantiateViewController(withIdentifier: "ThankYouViewController") as? ThankYouViewController
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
