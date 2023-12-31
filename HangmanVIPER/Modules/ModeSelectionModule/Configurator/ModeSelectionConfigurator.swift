//
//  ModeSelectionConfigurator.swift
//  HangmanVIPER
//
//  Created by Константин Натаров on 08.08.2023.
//

protocol ModeSelectionConfiguratorProtocol {
    func configure(with view: ModeSelectionViewController)
}

final class ModeSelectionConfigurator: ModeSelectionConfiguratorProtocol {
    func configure(with view: ModeSelectionViewController) {
        let presenter = ModeSelectionPresenter(view: view)
        let interactor = ModeSelectionInteractor(presenter: presenter)
        let router = ModeSelectionRouter(view: view)
        
        view.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router
    }
    
    
}
