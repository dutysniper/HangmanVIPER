//
//  SingleGamePresenter.swift
//  HangmanVIPER
//
//  Created by Степан Фоминцев on 17.08.2023.
//

import Foundation

protocol SingleGamePresenterProtocol: AnyObject {
    var router: SingleGameRouterProtocol! { get set }
    init(view: SingleGameMainScreenViewControllerProtocol)
    func configureView()
}

final class SingleGamePresenter: SingleGamePresenterProtocol {
    private unowned let view: SingleGameMainScreenViewControllerProtocol
    
    var router: SingleGameRouterProtocol!
    var interactor: SingleGameInteractorProtocol!
    
    required init(view: SingleGameMainScreenViewControllerProtocol) {
        self.view = view
    }
    
    func configureView() {
        interactor.getWord { [unowned self] wordModel in
            view.setupUI(withWord: wordModel)
        }
    }
}
