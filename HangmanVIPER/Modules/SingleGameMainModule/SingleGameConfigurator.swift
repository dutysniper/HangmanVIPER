//
//  SingleGameConfigurator.swift
//  HangmanVIPER
//
//  Created by Степан Фоминцев on 17.08.2023.
//

import Foundation

protocol SingleGameConfiguratorProtocol: AnyObject {
    func configure(withView view: SingleGameMainScreenViewController)
}

class SingleGameConfigurator: SingleGameConfiguratorProtocol {
    func configure(withView view: SingleGameMainScreenViewController) {
        let presenter = SingleGamePresenter(view: view)
        let interactor = SingleGameInteractor()
        view.presenter = presenter
        presenter.interactor = interactor
    }
}
