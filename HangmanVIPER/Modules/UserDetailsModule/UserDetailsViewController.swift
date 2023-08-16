//
//  UserDetailsViewController.swift
//  HangmanVIPER
//
//  Created by Константин Натаров on 15.08.2023.
//

import UIKit

protocol UserDetailsViewControllerProtocol: AnyObject {
    func setupUI()
    func setImage(_ image: UIImage)
}

final class UserDetailsViewController: UIViewController {
    var configurator =  UserDetailsConfigurator()
    var presenter: UserDetailsPresenterProtocol!
    
    private var userProfilePhoto = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configurator.configure(with: self)
        presenter.configureViewController()
    }
}

//MARK: - UserDetailsViewControllerProtocolMethods
extension UserDetailsViewController: UserDetailsViewControllerProtocol {
    func setupUI() {
        view.backgroundColor = UIColor(named: "myGreen")
        print("Модуль запущен и работает нормально")
        setupUserImage()
    }
    
    //MARK: - setup UI elements
    private func setupUserImage() {
        userProfilePhoto.frame = CGRect(x: 100, y: 100, width: 150, height: 150)
        userProfilePhoto.layer.cornerRadius = userProfilePhoto.frame.size.width / 2
        userProfilePhoto.layer.masksToBounds = true
        userProfilePhoto.layer.borderColor = UIColor.gray.cgColor
        userProfilePhoto.layer.borderWidth = 2
        userProfilePhoto.contentMode = .scaleAspectFill
        userProfilePhoto.isUserInteractionEnabled = true // Включаем пользовательский ввод
        userProfilePhoto.image = UIImage(named: "UserEmptyImage")
        view.addSubview(userProfilePhoto)
        
        userProfilePhoto.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            userProfilePhoto.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            userProfilePhoto.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            userProfilePhoto.widthAnchor.constraint(equalToConstant: 150),
            userProfilePhoto.heightAnchor.constraint(equalToConstant: 150)
        ])
        
        // Добавляем жест нажатия
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(imageTapped))
        userProfilePhoto.addGestureRecognizer(tapGesture)
    }
    @objc func imageTapped() {
        // Открываем галерею для выбора изображения
        presenter.photoTapped()
        print("Открываем Photos и выбираем картинку")
    }
    func setImage(_ image: UIImage) {
        print("Финальный метод обновления фото")
        userProfilePhoto.image = image
       }
}
