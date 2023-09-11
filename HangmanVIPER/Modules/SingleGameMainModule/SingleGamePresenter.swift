//
//  SingleGamePresenter.swift
//  HangmanVIPER
//
//  Created by Степан Фоминцев on 17.08.2023.
//

import Foundation

protocol SingleGamePresenterProtocol: AnyObject {
    var router: SingleGameRouterProtocol! { get set }
    // не нужно описывать инициализатор протоколом
    init(view: SingleGameMainScreenViewControllerProtocol)
    func configureView()
    func letterPressed(_ letter: String)
    func openTheLetter(_ word: String)
    func takeTheHeart()
    func endTheGame(isWin: Bool)
    func goToMainMenu()
    func reloadVC()
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
    
    // Нажалась буква
    func letterPressed(_ letter: String) {
        interactor.isValidLetter(letter)
    }
    
    // Открывает букву во вью
    func openTheLetter(_ word: String) {
        view.openTheLetter(word)
    }
    
    // Забирает сердечко
    func takeTheHeart() {
        view.takeTheHeart()
    }
    
    // Срабатывает при угадывании слова или когда кончились сердечки
    func endTheGame(isWin: Bool) {
        isWin ? print("Победа") : print("Поражение")
        view.showGameOverViewWith(result: isWin)
    }
    
    func goToMainMenu() {
        router.closeTheView()
    }
    
    // Restart game
    func reloadVC() {
        view.resetUI()
        configureView()
    }
}
