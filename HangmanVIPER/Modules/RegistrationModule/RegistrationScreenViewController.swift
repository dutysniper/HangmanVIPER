//
//  RegistrationScreenViewController.swift
//  HangmanVIPER
//
//  Created by Константин Натаров on 11.09.2023.
//

import UIKit
import SwiftUI

protocol RegistrationScreenViewControllerProtocol: AnyObject {
    func setupUI()
}

final class RegistrationScreenViewController: UIViewController, RegistrationScreenViewControllerProtocol {
    private let buttonFactory = ButtonFactory()
    
    private let firstNameTF = UITextField()
    private let lastNameTF = UITextField()
    private let loginTF = UITextField()
    private let passwordTF = UITextField()
    private let emailTF = UITextField()
    private let repeatedPasswordTF = UITextField()
    
    private let firstNameLabel = UILabel()
    private let lastNameLabel = UILabel()
    private let loginLabel = UILabel()
    private let passwordLabel = UILabel()
    private let emailLabel = UILabel()
    private let repeatedPasswordLabel = UILabel()
    private let aboutRegistrationLabel = UILabel()
    private let aboutRegistrationDetailsLabel = UILabel()
    
    private var tempTransitButton: UIButton!
    private var registrationButton: UIButton!
    
    private let aboutRegistrationStackView = UIStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
    }
}

//MARK: - setupUI
extension RegistrationScreenViewController {
    func setupUI() {
        setupAboutText()
        setupTempBtn()
        setupLoginStackView()
        setupPasswordStackView()
        setupRepeatedPWStackView()
        setupEmailStackView()
        registrationButtonSetup()
    }
    
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
    
    private func setupLoginStackView() {
        let loginStackView = UIStackView(
            arrangedSubviews: [loginLabel, loginTF]
        )
        loginLabel.text = "Логин"
        loginLabel.font = UIFont.systemFont(ofSize: 16)
        loginLabel.textColor = .black
        loginTF.placeholder = "Придумайте логин"
        loginTF.layer.cornerRadius = 20
        loginTF.borderStyle = .roundedRect
        loginTF.widthAnchor.constraint(equalToConstant: 400).isActive = true
        
        loginStackView.axis = .vertical
        loginStackView.spacing = 8
        loginStackView.alignment = .leading
        
        loginStackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(loginStackView)
        
        NSLayoutConstraint.activate(
            [
                loginStackView.topAnchor.constraint(equalTo: aboutRegistrationDetailsLabel.bottomAnchor, constant: 30),
                loginStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16)
        ]
        )
    }
    
    private func setupPasswordStackView() {
        let passwordStackView = UIStackView(
            arrangedSubviews: [passwordLabel, passwordTF]
        )
        passwordLabel.text = "Пароль"
        passwordLabel.font = UIFont.systemFont(ofSize: 16)
        passwordLabel.textColor = .black
        passwordTF.placeholder = "Пароль не менее 6 символов"
        passwordTF.layer.cornerRadius = 20
        passwordTF.borderStyle = .roundedRect
        passwordTF.widthAnchor.constraint(equalToConstant: 400).isActive = true
        
        passwordStackView.axis = .vertical
        passwordStackView.spacing = 8
        passwordStackView.alignment = .leading
        
        passwordStackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(passwordStackView)
        
        NSLayoutConstraint.activate(
            [
                passwordStackView.topAnchor.constraint(equalTo: loginTF.bottomAnchor, constant: 16),
                passwordStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16)
        ]
        )
    }
    
    private func setupRepeatedPWStackView() {
        let repeatedPWStackView = UIStackView(
            arrangedSubviews: [repeatedPasswordLabel, repeatedPasswordTF]
        )
        repeatedPasswordLabel.text = "Повторите пароль"
        repeatedPasswordLabel.font = UIFont.systemFont(ofSize: 16)
        repeatedPasswordLabel.textColor = .black
        repeatedPasswordTF.placeholder = "Пароли должны совпадать"
        repeatedPasswordTF.layer.cornerRadius = 20
        repeatedPasswordTF.borderStyle = .roundedRect
        repeatedPasswordTF.widthAnchor.constraint(equalToConstant: 400).isActive = true
        
        repeatedPWStackView.axis = .vertical
        repeatedPWStackView.spacing = 8
        repeatedPWStackView.alignment = .leading
        
        repeatedPWStackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(repeatedPWStackView)
        
        NSLayoutConstraint.activate(
            [
                repeatedPWStackView.topAnchor.constraint(equalTo: passwordTF.bottomAnchor, constant: 16),
                repeatedPWStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16)
        ]
        )
    }
    
    private func setupEmailStackView() {
        let emailStackView = UIStackView(
            arrangedSubviews: [emailLabel, emailTF]
        )
        emailLabel.text = "Электронная почта"
        emailLabel.font = UIFont.systemFont(ofSize: 16)
        emailLabel.textColor = .black
        emailTF.placeholder = "Введите ваш email"
        emailTF.layer.cornerRadius = 20
        emailTF.borderStyle = .roundedRect
        emailTF.widthAnchor.constraint(equalToConstant: 400).isActive = true
        
        emailStackView.axis = .vertical
        emailStackView.spacing = 8
        emailStackView.alignment = .leading
        
        emailStackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(emailStackView)
        
        NSLayoutConstraint.activate(
            [
                emailStackView.topAnchor.constraint(equalTo: repeatedPasswordTF.bottomAnchor, constant: 16),
                emailStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16)
        ]
        )
    }
    
    private func registrationButtonSetup() {
        registrationButton = buttonFactory.createButton(title: "Зарегистрироваться", titleColor: .white, backgroundColor: .blue)
        
        registrationButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(registrationButton)
        NSLayoutConstraint.activate(
            [
                registrationButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                registrationButton.topAnchor.constraint(equalTo: emailTF.bottomAnchor, constant: 16)
        ]
        )
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
