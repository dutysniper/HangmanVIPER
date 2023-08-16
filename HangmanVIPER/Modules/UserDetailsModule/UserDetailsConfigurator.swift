//
//  UserDetailsConfigurator.swift
//  HangmanVIPER
//
//  Created by Константин Натаров on 16.08.2023.
//

import Foundation

protocol UserDetailsConfiguratorProtocol {
    func configure(with viewController: UserDetailsViewController)
}

final class UserDetailsConfigurator: UserDetailsConfiguratorProtocol {
    func configure(with viewController: UserDetailsViewController) {
        let presenter = UserDetailsPresenter(viewController: viewController)
        let interactor =  UserDetailsInteractor(presenter: presenter)
        let router = UserDetailsRouter(viewController: viewController)
        
        viewController.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router
    }
}
