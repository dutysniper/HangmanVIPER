//
//  SingleGameConfigurator.swift
//  HangmanVIPER
//
//  Created by Степан Фоминцев on 17.08.2023.
//

import UIKit

protocol SingleGameConfiguratorProtocol: AnyObject {
    func configure(withView view: SingleGameMainScreenViewController)
}

final class SingleGameConfigurator: SingleGameConfiguratorProtocol {
    func configure(withView view: SingleGameMainScreenViewController) {
        let presenter = SingleGamePresenter(view: view)
        let interactor = SingleGameInteractor(presenter: presenter)
        let router = SingleGameRouter(view: view)
        
        view.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router
    }
}
