//
//  ModeSelectionPresenter.swift
//  HangmanVIPER
//
//  Created by Константин Натаров on 29.07.2023.
//

import Foundation

protocol ModeSelectionPresenterProtocol: AnyObject {
    var router: ModeSelectionRouterProtocol! { get set }
    func configureView() // нужен или нет?
    func singlePlayerButtonClicked()
    func multiPlayerButtonClicked()
}

final class ModeSelectionPresenter: ModeSelectionPresenterProtocol {
    var router: ModeSelectionRouterProtocol!
    var interactor: ModeSelectionInteractorProtocol!
    
    private unowned let view: ModeSelectionViewProtocol
    
    required init(view: ModeSelectionViewProtocol) {
        self.view = view
    }
    
    func configureView() {
        // нужен или нет?
        // MARK: нужен
        view.setupUI()
    }
    
    func singlePlayerButtonClicked() {
        router.openSingleGameScreen()
    }
    
    func multiPlayerButtonClicked() {
        //TODO: - создать переход на мультиплеер
    }
    
}

