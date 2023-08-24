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
    func openTheLetter(_ word: String)
    func takeTheHeart()
    func endTheGame()
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
    
    func openTheLetter(_ word: String) {
        view.openTheLetter(word)
    }
    
    func takeTheHeart() {
        view.takeTheHeart()
    }
    
    func endTheGame() {
        router.closeTheView()
        // Тут алерт
    }
}
