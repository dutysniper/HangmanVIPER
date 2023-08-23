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
    func letterPressed(_ letter: String)
    func openTheLetter(at index: [Int])
    func takeTheHeart()
}

final class SingleGamePresenter: SingleGamePresenterProtocol {
    private unowned let view: SingleGameMainScreenViewControllerProtocol
    
    var router: SingleGameRouterProtocol!
    var interactor: SingleGameInteractorProtocol!
    
    required init(view: SingleGameMainScreenViewControllerProtocol) {
        self.view = view
    }
    
    func configureView() {
        interactor.getNewWord { [unowned self] wordModel in
            view.setupUI(with: wordModel)
        }
    }
    
    func letterPressed(_ letter: String) {
        interactor.isValidLetter(letter)
    }
    
    func openTheLetter(at index: [Int]) {
        
    }
    
    func takeTheHeart() {
        
    }
}
