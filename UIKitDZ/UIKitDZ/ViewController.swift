// ViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// ViewController
class ViewController: UIViewController {
    private lazy var startButton: UIButton = {
        let button = UIButton(frame: CGRect(
            x: 20,
            y: view.frame.height / 2,
            width: view.frame.width - 40,
            height: 40
        ))
        button.setTitle("Начать", for: .normal)
        button.backgroundColor = .green
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(startButtonClick), for: .touchUpInside)
        return button
    }()

    private lazy var wordLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 50, y: 150, width: Int(view.frame.width) - 100, height: 40))
        label.text = "Вы ввели слово"
        label.font = .boldSystemFont(ofSize: 20)
        label.textAlignment = .center
        label.isHidden = true
        return label
    }()

    private lazy var inputLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 50, y: 200, width: Int(view.frame.width) - 100, height: 40))
        label.text = ""
        label.font = .italicSystemFont(ofSize: 20)
        label.textColor = .gray
        label.textAlignment = .center
        label.isHidden = true
        return label
    }()

    private lazy var resultLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 50, y: 350, width: Int(view.frame.width) - 100, height: 100))
        label.text = "А вот что получится, если читать справо налево"
        label.font = .boldSystemFont(ofSize: 20)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.isHidden = true
        return label
    }()

    private lazy var outputLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 50, y: 450, width: Int(view.frame.width) - 100, height: 40))
        label.text = ""
        label.font = .italicSystemFont(ofSize: 20)
        label.textAlignment = .center
        label.textColor = .gray
        label.isHidden = true
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(startButton)
        view.addSubview(wordLabel)
        view.addSubview(inputLabel)
        view.addSubview(resultLabel)
        view.addSubview(outputLabel)
    }

//    func wordLabel(text: String, rect: CGRect , isHidden: Bool){
//        let label = UILabel(frame: rect)
//        label.text = text
//        label.font = .boldSystemFont(ofSize: 20)
//        label.isHidden = isHidden
//        view.addSubview(label)
//    }
//
//    func resultLabel(text: String, rect: CGRect, isHidden: Bool){
//        let label = UILabel(frame: rect)
//        label.text = text
//        label.textColor = .gray
//        label.font = .italicSystemFont(ofSize: 20)
//        label.isHidden = isHidden
//        view.addSubview(label)
//    }

    func reverseText(_ input: String) {
        let model = Model()
        let result = model.reverseText(input)
        outputLabel.text = result
        outputLabel.isHidden = false
    }

    @objc func startButtonClick() {
        let alertController = UIAlertController(title: "Введите ваше слово", message: nil, preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .default) { _ in
            guard let text = alertController.textFields?.first?.text else { return }
            self.reverseText(text)
            self.inputLabel.text = text
            self.startButton.frame = CGRect(
                x: 20,
                y: self.view.frame.height - 200,
                width: self.view.frame.width - 40,
                height: 40
            )
            self.inputLabel.isHidden = false
            self.wordLabel.isHidden = false
            self.resultLabel.isHidden = false
        }
        alertController.addTextField()
        alertController.addAction(action)
        present(alertController, animated: true)
    }
}
