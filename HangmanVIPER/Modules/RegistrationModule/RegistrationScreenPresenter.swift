//
//  RegistrationScreenPresenter.swift
//  HangmanVIPER
//
//  Created by Константин Натаров on 23.09.2023.
//

import Foundation

protocol RegistrationScreenPresenterProtocol {
    var router: RegistrationScreenRouterProtocol! { get set }
    var interactor: RegistrationScreenInteractorProtocol! { get set }
    func configureViewController()
}

final class RegistrationScreenPresenter: RegistrationScreenPresenterProtocol {
    var router: RegistrationScreenRouterProtocol!
    var interactor: RegistrationScreenInteractorProtocol!
    
    private unowned let viewController: RegistrationScreenViewControllerProtocol
    
    required init(viewController: RegistrationScreenViewControllerProtocol) {
        self.viewController = viewController
    }
    func configureViewController() {
        viewController.setupUI()
    }
    
    
}
