// DetailViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// DetailViewController
class DetailViewController: UIViewController {
    var name = ""
    var surName = ""
    var number = ""
    var email = ""
    var bd = ""
    var footSize = ""

    // MARK: Visual Properties

    private lazy var birthdayField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.backgroundColor = .systemGray6
        textField.placeholder = "День рождения"
        textField.font = .systemFont(ofSize: 14)
        view.addSubview(textField)
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()

    private lazy var footSizeField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.backgroundColor = .systemGray6
        textField.placeholder = "Размер ноги"
        textField.font = .systemFont(ofSize: 14)
        view.addSubview(textField)
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()

    private lazy var saveButton: UIButton = {
        let button = UIButton()
        button.setTitle("Сохранить", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemPink
        button.layer.cornerRadius = 12
        button.addTarget(self, action: #selector(clickedSaveButton), for: .touchUpInside)
        view.addSubview(button)
        button.isHidden = true
        button.translatesAutoresizingMaskIntoConstraints = false

        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
    }

    // MARK: Весь визуал в этом функции

    private func setupUI() {
        let myDataLabel = makeLabel(text: "Мои данные")
        let nameField = makeTextfield(text: "Имя")
        let surnameField = makeTextfield(text: "Фамилия")
        let numberField = makeTextfield(text: "Номер телефона")
        let emailField = makeTextfield(text: "Почта")

        nameField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        surnameField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        numberField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        emailField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        footSizeField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingDidEnd)

        createDatePicker()
        createGenderPicker()

        NSLayoutConstraint.activate([
            myDataLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            myDataLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            nameField.topAnchor.constraint(equalTo: myDataLabel.bottomAnchor, constant: 20),
            nameField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            nameField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),

            surnameField.topAnchor.constraint(equalTo: nameField.bottomAnchor, constant: 20),
            surnameField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            surnameField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),

            numberField.topAnchor.constraint(equalTo: surnameField.bottomAnchor, constant: 20),
            numberField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            numberField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),

            footSizeField.topAnchor.constraint(equalTo: numberField.bottomAnchor, constant: 20),
            footSizeField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            footSizeField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),

            birthdayField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            birthdayField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            birthdayField.topAnchor.constraint(equalTo: footSizeField.bottomAnchor, constant: 20),

            emailField.topAnchor.constraint(equalTo: birthdayField.bottomAnchor, constant: 20),
            emailField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            emailField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),

            saveButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100),
            saveButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            saveButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            saveButton.heightAnchor.constraint(equalToConstant: 44),
        ])
    }

    // MARK: Функции ддя создание элементов

    private func makeTextfield(text: String) -> UITextField {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.backgroundColor = .systemGray6
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
    let footSizePicker = UIPickerView()

    private func createToolbar() -> UIToolbar {
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressed))
        toolbar.setItems([doneButton], animated: true)
        return toolbar
    }

    private func createGenderToolBar() -> UIToolbar {
        let toolbar = UIToolbar()
        toolbar.sizeToFit()

        let saveButton = UIBarButtonItem(
            title: "Сохранить",
            style: .plain,
            target: self,
            action: #selector(saveGenderSelection)
        )
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(
            barButtonSystemItem: .cancel,
            target: self,
            action: #selector(cancelGenderSelection)
        )
        toolbar.setItems([cancelButton, flexibleSpace, saveButton], animated: false)

        return toolbar
    }

    private func createDatePicker() {
        datePicker.preferredDatePickerStyle = .inline
        birthdayField.inputView = datePicker
        birthdayField.inputAccessoryView = createToolbar()
    }

    private func createGenderPicker() {
        footSizePicker.dataSource = self
        footSizePicker.delegate = self
        footSizeField.inputView = footSizePicker
        footSizeField.inputAccessoryView = createGenderToolBar()
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
        birthdayField.text = "\(datePicker.date.formatted(date: .long, time: .omitted))"
        view.endEditing(true)
    }

    @objc func okPressed() {
        view.endEditing(true)
    }

    @objc func okGenderPressed() {
        let selectedRow = footSizePicker.selectedRow(inComponent: 0)
        let footSizeText = pickerView(footSizePicker, titleForRow: selectedRow, forComponent: 0)
        footSizeField.text = footSizeText
        view.endEditing(true)
    }

    // MARK: Оброботчики событие

    @objc func clickAdd() {
        print("будущем будет)")
    }
}

// MARK: Реализация протоколов пикера

extension DetailViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == footSizePicker {
            return 3
        }
        return 0
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == footSizePicker {
            switch row {
            case 0: return "37"
            case 1: return "38"
            case 2: return "39"
            default: return "40"
            }
        }
        return nil
    }

    @objc func clickedSaveButton() {
        saveButton.isHidden = true
    }

    @objc private func textFieldDidChange(_ textField: UITextField) {
        saveButton.isHidden = false
    }

    @objc private func saveGenderSelection() {
        let selectedRow = footSizePicker.selectedRow(inComponent: 0)
        let selectedValue = pickerView(footSizePicker, titleForRow: selectedRow, forComponent: 0)

        footSizeField.text = selectedValue

        view.endEditing(true) // Закрываем пикер
    }

    @objc private func cancelGenderSelection() {
        view.endEditing(true) // Закрываем пикер
    }
}
