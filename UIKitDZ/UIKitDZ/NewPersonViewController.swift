// NewPersonViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// NewPersonViewController - контроллер для добавление новых блоков людей с днями рождения
final class NewPersonViewController: UIViewController {
    //MARK: Visual Properties
    private lazy var cancelButton: UIButton = {
        let button = UIButton()
        button.setTitle("Calcel", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.titleLabel?.font = UIFont(name: "Verdana", size: 14)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(clickAdd), for: .touchUpInside)
        return button
    }()

    private lazy var addButton: UIButton = {
        let button = UIButton()
        button.setTitle("Add", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.titleLabel?.font = UIFont(name: "Verdana", size: 14)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(clickAdd), for: .touchUpInside)
        return button
    }()

    private lazy var profileImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Image")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.frame = CGRect(origin: .zero, size: CGSize(width: 125, height: 125))
        return imageView
    }()

    private lazy var changePhotoButton: UIButton = {
        let button = UIButton()
        button.setTitle("Change photo", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.titleLabel?.font = UIFont(name: "Verdana", size: 14)
        button.translatesAutoresizingMaskIntoConstraints = false
        // button.addTarget(self, action: #selector(loginButtonClick), for: .touchUpInside)
        return button
    }()
    
    private lazy var birthdayField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.placeholder = "Typing Birthday"
        textField.font = .systemFont(ofSize: 14)
        view.addSubview(textField)
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()

    private lazy var telegramField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.placeholder = "Typing Telegram"
        textField.font = .systemFont(ofSize: 14)
        textField.addTarget(self, action: #selector(clickTelegaField), for: .editingDidBegin)
        view.addSubview(textField)
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()

    private lazy var ageField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.placeholder = "Typing Age"
        textField.font = .systemFont(ofSize: 14)
        view.addSubview(textField)
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()

    private lazy var genderField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.placeholder = "Indicate Gender"
        textField.font = .systemFont(ofSize: 14)
        view.addSubview(textField)
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
    }
    //MARK: Весь визуал в этом функции
    private func setupUI() {
        let fullNameLabel = makeLabel(text: "Name Surname")
        let fullNameField = makeTextfield(text: "Typing Name Surname")
        let birthdayLabel = makeLabel(text: "Birthday")
        let ageLabel = makeLabel(text: "Age")
        let genderLabel = makeLabel(text: "Gender")
        let telegramLabel = makeLabel(text: "Telegram")
        createDatePicker()
        createAgePicker()
        createGenderPicker()
        view.addSubview(profileImage)
        view.addSubview(changePhotoButton)
        view.addSubview(addButton)
        view.addSubview(cancelButton)

        NSLayoutConstraint.activate([
            cancelButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            cancelButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15),
            addButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            addButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15),

            profileImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            profileImage.topAnchor.constraint(equalTo: addButton.topAnchor, constant: 30),
            profileImage.widthAnchor.constraint(equalToConstant: 125),
            profileImage.heightAnchor.constraint(equalToConstant: 125),

            changePhotoButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            changePhotoButton.topAnchor.constraint(equalTo: profileImage.bottomAnchor, constant: 8),

            fullNameLabel.topAnchor.constraint(equalTo: changePhotoButton.bottomAnchor, constant: 10),
            fullNameField.topAnchor.constraint(equalTo: fullNameLabel.bottomAnchor, constant: 10),

            birthdayLabel.topAnchor.constraint(equalTo: fullNameField.bottomAnchor, constant: 10),

            birthdayField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            birthdayField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            birthdayField.topAnchor.constraint(equalTo: birthdayLabel.bottomAnchor, constant: 10),

            ageLabel.topAnchor.constraint(equalTo: birthdayField.bottomAnchor, constant: 10),
            ageField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            ageField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            ageField.topAnchor.constraint(equalTo: ageLabel.bottomAnchor, constant: 10),

            genderLabel.topAnchor.constraint(equalTo: ageField.bottomAnchor, constant: 10),
            genderField.topAnchor.constraint(equalTo: genderLabel.bottomAnchor, constant: 10),
            genderField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            genderField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),

            telegramLabel.topAnchor.constraint(equalTo: genderField.bottomAnchor, constant: 10),
            telegramField.topAnchor.constraint(equalTo: telegramLabel.bottomAnchor, constant: 10),
            telegramField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            telegramField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
        ])
    }

    //MARK: Функции ддя создание элементов
    private func makeTextfield(text: String) -> UITextField {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.placeholder = text
        textField.font = .systemFont(ofSize: 14)
        textField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(textField)
        NSLayoutConstraint.activate([
            textField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            textField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20)
        ])
        return textField
    }

    let datePicker = UIDatePicker()
    let agePicker = UIPickerView()
    let genderPicker = UIPickerView()

    private func createToolbar() -> UIToolbar {
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressed))
        toolbar.setItems([doneButton], animated: true)
        return toolbar
    }

    private func createAgeToolBar() -> UIToolbar {
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let okButton = UIBarButtonItem(title: "ok", style: .done, target: nil, action: #selector(okPressed))
        toolbar.setItems([flexibleSpace, okButton], animated: true)
        return toolbar
    }

    private func createGenderToolBar() -> UIToolbar {
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let okButton = UIBarButtonItem(title: "ok", style: .done, target: nil, action: #selector(okGenderPressed))
        toolbar.setItems([flexibleSpace, okButton], animated: true)
        return toolbar
    }

    private func createAgePicker() {
        agePicker.dataSource = self
        agePicker.delegate = self
        ageField.inputView = agePicker
        ageField.inputAccessoryView = createAgeToolBar()
    }

    private func createDatePicker() {
        datePicker.preferredDatePickerStyle = .inline
        birthdayField.inputView = datePicker
        birthdayField.inputAccessoryView = createToolbar()
    }

    private func createGenderPicker() {
        genderPicker.dataSource = self
        genderPicker.delegate = self
        genderField.inputView = genderPicker
        genderField.inputAccessoryView = createGenderToolBar()
    }

    private func makeLabel(text: String) -> UILabel {
        let label = UILabel()
        label.text = text
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Verdana-Bold", size: 14)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.textColor = .black
        label.textAlignment = .center
        view.addSubview(label)
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20)
        ])
        return label
    }

    @objc func donePressed() {
        let selectedYear = Calendar.current.component(.year, from: datePicker.date)
        let currentYear = Calendar.current.component(.year, from: Date())
        let age = currentYear - selectedYear

        birthdayField.text = "\(datePicker.date.formatted(date: .long, time: .omitted))"
        ageField.text = "\(age)"
        view.endEditing(true)
    }

    @objc func okPressed() {
        ageField.text = "\(agePicker.selectedRow(inComponent: 0))"
        view.endEditing(true)
    }

    @objc func okGenderPressed() {
        let selectedRow = genderPicker.selectedRow(inComponent: 0)
        let genderText = pickerView(genderPicker, titleForRow: selectedRow, forComponent: 0)
        genderField.text = genderText
        view.endEditing(true)
    }
    //MARK: Оброботчики событие
    @objc func clickTelegaField() {
        let alertController = UIAlertController(title: "Please enter Telegram", message: nil, preferredStyle: .alert)
        alertController.addTextField { textField in
            textField.placeholder = "Typing Telegram"
        }
        let cancel = UIAlertAction(title: "Cancel", style: .cancel)
        let action = UIAlertAction(title: "Ok", style: .default) { _ in
            if let textField = alertController.textFields?.first, let telegram = textField.text {
                self.telegramField.text = telegram
            }
        }

        alertController.addAction(action)
        alertController.addAction(cancel)
        alertController.preferredAction = action
        present(alertController, animated: true)
    }


    @objc func clickAdd() {
        print("будущем будет)")
    }
}
//MARK: Реализация протоколов пикера
extension NewPersonViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == agePicker {
            return 129
        } else if pickerView == genderPicker {
            return 2
        }
        return 0
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == agePicker {
            return "\(row)"
        } else if pickerView == genderPicker {
            switch row {
            case 0: return "Male"
            case 1: return "Female"
            default: return "Other"
            }
        }
        return nil
    }
}
