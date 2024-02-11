// ReminderViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// ReminderViewController
class ReminderViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            image: UIImage(systemName: "plus"),
            style: .done,
            target: self,
            action: #selector(clickPlus)
        )
        view.backgroundColor = .systemBackground
        let infoPerson = createInfoList(
            image: UIImage(named: "Image"),
            title: "Kadyr",
            description: "ISANII dsjcods",
            days: "32 days"
        )
        view.addSubview(infoPerson)
        let infoPerson1 = createInfoList(
            image: UIImage(named: "Image"),
            title: "Kadyr",
            description: "ISANII dsjcods",
            days: "32 days"
        )
        view.addSubview(infoPerson1)
        let infoPerson2 = createInfoList(
            image: UIImage(named: "Image"),
            title: "Kadyr",
            description: "ISANII dsjcods",
            days: "32 days"
        )
        view.addSubview(infoPerson2)

        NSLayoutConstraint.activate([
            infoPerson.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            infoPerson.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            infoPerson.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            infoPerson.heightAnchor.constraint(equalToConstant: 82),
            infoPerson1.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            infoPerson1.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            infoPerson1.topAnchor.constraint(equalTo: infoPerson.bottomAnchor, constant: 20),
            infoPerson1.heightAnchor.constraint(equalToConstant: 82),
            infoPerson2.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            infoPerson2.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            infoPerson2.topAnchor.constraint(equalTo: infoPerson1.bottomAnchor, constant: 20),
            infoPerson2.heightAnchor.constraint(equalToConstant: 82),
        ])
    }

    func createInfoList(image: UIImage?, title: String, description: String, days: String) -> UIView {
        let containerView = UIView()
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.backgroundColor = .systemPurple
        containerView.layer.cornerRadius = 10

        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(imageView)

        let leftLabel = UILabel()
        leftLabel.text = title
        leftLabel.font = UIFont(name: "Verdana-Bold", size: 14)
        leftLabel.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(leftLabel)

        let descriptionLabel = UILabel()
        descriptionLabel.text = description
        descriptionLabel.font = UIFont(name: "Verdana", size: 14)
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(descriptionLabel)

        let rightLabel = UILabel()
        rightLabel.text = days
        rightLabel.numberOfLines = 0
        rightLabel.lineBreakMode = .byWordWrapping
        rightLabel.font = UIFont(name: "Verdana-Bold", size: 14)
        rightLabel.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(rightLabel)

        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            imageView.topAnchor.constraint(equalTo: containerView.topAnchor),
            imageView.widthAnchor.constraint(equalToConstant: 75),
            imageView.heightAnchor.constraint(equalToConstant: 75)

        ])

        NSLayoutConstraint.activate([
            leftLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 8),
            leftLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 16),
        ])

        NSLayoutConstraint.activate([
            descriptionLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 10),
            descriptionLabel.topAnchor.constraint(equalTo: leftLabel.bottomAnchor, constant: 10),
        ])

        NSLayoutConstraint.activate([
            rightLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 20),
            rightLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -10),
            rightLabel.widthAnchor.constraint(equalToConstant: 50)
        ])

        // Возвращаем созданный контейнерный UIView
        return containerView
    }

    @objc func clickPlus() {
        let vc = NewPersonViewController()
        navigationController?.present(vc, animated: true)
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
