//
//  UserDetailsViewController.swift
//  HangmanVIPER
//
//  Created by Константин Натаров on 15.08.2023.
//

import UIKit

protocol UserDetailsViewControllerProtocol: AnyObject {
    func setupUI()
}

final class UserDetailsViewController: UIViewController {
    var configurator =  UserDetailsConfigurator()
    var presenter: UserDetailsPresenterProtocol!

    override func viewDidLoad() {
        super.viewDidLoad()
        configurator.configure(with: self)
        presenter.configureViewController()
    }
}

extension UserDetailsViewController: UserDetailsViewControllerProtocol {
    func setupUI() {
        view.backgroundColor = .magenta
        print("Модуль запущен и работает нормально")
    }
    
    
}
