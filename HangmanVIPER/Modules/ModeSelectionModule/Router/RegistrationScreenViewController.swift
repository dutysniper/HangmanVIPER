//
//  RegistrationScreenViewController.swift
//  HangmanVIPER
//
//  Created by Константин Натаров on 11.09.2023.
//

import UIKit
import SwiftUI

final class RegistrationScreenViewController: UIViewController {
    private let buttonFactory = ButtonFactory()
    
    private let firstNameTF = UITextField()
    private let lastNameTF = UITextField()
    private let loginTF = UITextField()
    private let passwordTF = UITextField()
    private let emailTF = UITextField()
    private let repeatedEmailTF = UITextField()
    
    private let firstNameLabel = UILabel()
    private let lastNameLabel = UILabel()
    private let loginLabel = UILabel()
    private let passwordLabel = UILabel()
    private let emailLabel = UILabel()
    private let repeatedEmailLabel = UILabel()
    private let aboutRegistrationLabel = UILabel()
    private let aboutRegistrationDetailsLabel = UILabel()
    
    private var tempTransitButton: UIButton!
    
    private let aboutRegistrationStackView = UIStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupAboutText()
        setupTempBtn()
        
        for family in UIFont.familyNames.sorted() {
            let names = UIFont.fontNames(forFamilyName: family)
            print("Family: \(family) Font Names: \(names)" )
        }
        
    }
}

//MARK: - setupUI
extension RegistrationScreenViewController {
    func setupAboutText() {
        aboutRegistrationLabel.text = "Создай свой аккаунт"
        aboutRegistrationLabel.font = UIFont.systemFont(ofSize: 26)
        aboutRegistrationLabel.textColor = .black
        
        aboutRegistrationDetailsLabel.text = "Соревнуйтесь с игроками по всему миру, зарабатывайте новые звания и копите монеты"
        aboutRegistrationDetailsLabel.font  = UIFont.systemFont(ofSize: 16)
        aboutRegistrationDetailsLabel.textColor = .gray
        aboutRegistrationDetailsLabel.numberOfLines = 0

        aboutRegistrationStackView.addArrangedSubview(aboutRegistrationLabel)
        aboutRegistrationStackView.addArrangedSubview(aboutRegistrationDetailsLabel)
        aboutRegistrationStackView.axis = .vertical
        aboutRegistrationStackView.alignment = .leading
        aboutRegistrationStackView.spacing = 8
        view.addSubview(aboutRegistrationStackView)
        aboutRegistrationStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(
        [
            aboutRegistrationStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            aboutRegistrationStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 16),
            aboutRegistrationStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16)
        ]
        )
    }
    private func setupTempBtn() {
        tempTransitButton = buttonFactory.createButton(title: "Главное меню", titleColor: .black, backgroundColor: .white)
        tempTransitButton.addTarget(self, action: #selector(goToMainMenu), for: .touchUpInside)
        tempTransitButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tempTransitButton)
        NSLayoutConstraint.activate(
            [
                tempTransitButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                tempTransitButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16)
        ]
        )
    }
    @objc func goToMainMenu() {
        if let navigationController = UIApplication.shared.keyWindow?.rootViewController as? UINavigationController {
            navigationController.pushViewController(ModeSelectionViewController(), animated: true)
        }
    }
}

//MARK: - swiftUI preview setup
struct RegistrationScreenViewControllerWrapper: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> RegistrationScreenViewController {
        return RegistrationScreenViewController()
    }

    func updateUIViewController(_ uiViewController: RegistrationScreenViewController, context: Context) {
       
    }

    typealias UIViewControllerType = RegistrationScreenViewController
}

struct RegistrationScreenPreview: PreviewProvider {
    static var previews: some View {
        RegistrationScreenViewControllerWrapper()
            .previewDevice(PreviewDevice(rawValue: "iPhone 12")) // Adjust to your preferred device
            .previewDisplayName("Registration Screen")
    }
}
