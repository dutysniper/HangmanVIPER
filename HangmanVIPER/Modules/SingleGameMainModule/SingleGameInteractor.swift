//
//  SingleGameInteractor.swift
//  HangmanVIPER
//
//  Created by Степан Фоминцев on 17.08.2023.
//

import Foundation

protocol SingleGameInteractorProtocol: AnyObject {
    init(presenter: SingleGamePresenterProtocol)
    func getNewWord(completion: @escaping (WordModel) -> Void)
    func isValidLetter(_ letter: String)
}

final class SingleGameInteractor: SingleGameInteractorProtocol {
    unowned let presenter: SingleGamePresenterProtocol
    
    private let networkManager = NetworkManager.shared
    private var word: WordModel = WordModel(word: "", entry: Word(definition: ""))
    
    var isWin = false
    // Если все буквы открыты, то игра выиграна
    private var openedLettersIndexes: Set<Int> = [] {
        didSet {
            // немного шляпа с неймингом. word.word. можно обозвать типа wordModel.word.count - будет получше
            if openedLettersIndexes.count == word.word.count {
                isWin.toggle()
                presenter.endTheGame(isWin: true)
                openedLettersIndexes = []
                lifes = 7
            }
        }
    }
    // Если все жизни кончились, то игра проиграна
    private var lifes = 7 {
        didSet {
            if lifes == 0 {
                presenter.endTheGame(isWin: false)
                lifes = 7
                openedLettersIndexes = []
            }
        }
    }
    
    required init(presenter: SingleGamePresenterProtocol) {
        self.presenter = presenter
    }
    
    func getNewWord(completion: @escaping (WordModel) -> Void) {
        networkManager.fetchRandomWord(fileName: "wordListWithDefinition") { [unowned self] result in
            switch result {
            case .success(let _word):
                print(_word.word)
                word = _word
                completion(word)
            case .failure(let error):
                fatalError(error.localizedDescription)
            }
        }
    }
    
    // Передает букву в метод, если она есть, то проверяет какой индекс у этой
    // буквы в слове, далее индекс добавляется в массив. Потом составляется слово
    // и открытыми остаются буквы из массива. Например, массив
    // содержит [1, 3, 5], в презентер будет возвращаться "_о_о_а".
    // Если буквы нет, то вызывается метод, который забирает сердечко.
    func isValidLetter(_ letter: String) {
        if word.word.contains(letter) {
            var _word = ""
            for (i, l) in word.word.enumerated() {
                if letter == String(l) {
                    openedLettersIndexes.insert(i)
                }
            }
            for (i, l) in word.word.enumerated() {
                if openedLettersIndexes.contains(i) {
                    _word += String(l)
                } else {
                    _word += "_"
                }
            }
            presenter.openTheLetter(_word.map { String($0) }.joined(separator: " "))
        } else {
            lifes -= 1
            presenter.takeTheHeart()
        }
    }
    
}
