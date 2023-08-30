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
    private var openedLettersIndexes: [Int] = []
    
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
        //TODO: сделать так, что б буква изчезала, после того, как ее нажали, и строка сдвигалась
        if word.word.contains(letter) {
            var _word = ""
            for (i, l) in word.word.enumerated() {
                if letter == String(l) {
                    openedLettersIndexes.append(i)
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
            presenter.takeTheHeart()
        }
    }
    
}
