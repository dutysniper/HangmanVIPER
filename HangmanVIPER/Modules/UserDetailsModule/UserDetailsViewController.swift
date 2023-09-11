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
    private var userNameLabel = UILabel()
    
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
        setupUserNameLabel()
    }
    
    //MARK: - setup UI elements
    
    //TODO: Почему-то выбор фото открывается только со 2го раза с задержкой
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
    private func setupUserNameLabel() {
        userNameLabel.text = "Steve Jobs"
        userNameLabel.font = UIFont.systemFont(ofSize: 36)
        userNameLabel.textColor = .black
        
        userNameLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(userNameLabel)
        NSLayoutConstraint.activate(
            [
                userNameLabel.topAnchor.constraint(equalTo: userProfilePhoto.bottomAnchor, constant: 16),
                userNameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
            ])
    }
}

//MARK: - TableView methods
//extension UserDetailsViewController: UITableViewDelegate, UITableViewDataSource {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        5
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        var cell = UITableViewCell()
//        var contentCell =  cell.defaultContentConfiguration()
//    }
//}
