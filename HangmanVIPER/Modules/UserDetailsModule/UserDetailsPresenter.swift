//
//  UserDetailsPresenter.swift
//  HangmanVIPER
//
//  Created by Константин Натаров on 16.08.2023.
//

import Foundation

protocol UserDetailsPresenterProtocol: AnyObject {
    var router: UserDetailsRouterProtocol! { get set }
    var interactor: UserDetailsInteractorProtocol! { get set }
    func configureViewController()
}

final class UserDetailsPresenter: UserDetailsPresenterProtocol {
    var router: UserDetailsRouterProtocol!
    var interactor: UserDetailsInteractorProtocol!
    
    private unowned let viewController:  UserDetailsViewControllerProtocol
    
    required init(viewController: UserDetailsViewControllerProtocol) {
        self.viewController = viewController
    }
    
    func configureViewController() {
        viewController.setupUI()
    }
}


