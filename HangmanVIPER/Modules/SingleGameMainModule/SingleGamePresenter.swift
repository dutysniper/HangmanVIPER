//
//  SingleGamePresenter.swift
//  HangmanVIPER
//
//  Created by Степан Фоминцев on 17.08.2023.
//

import Foundation

protocol SingleGamePresenterProtocol: AnyObject {
    var router: SingleGameRouterProtocol! { get set }
    init(view: SingleGameMainScreenViewController)
    func configureView()
}

class SingleGamePresenter: SingleGamePresenterProtocol {
    let view: SingleGameMainScreenViewController
    
    var router: SingleGameRouterProtocol!
    var interactor: SingleGameInteractorProtocol!
    
    required init(view: SingleGameMainScreenViewController) {
        self.view = view
    }
    
    func configureView() {
        interactor.getWord { [unowned self] wordModel in
            view.setupUI(withWord: wordModel)
        }
    }
}
