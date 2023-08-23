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
    func getCurrentWord() -> WordModel
    func isValidLetter(_ letter: String)
}

final class SingleGameInteractor: SingleGameInteractorProtocol {
    private let networkManager = NetworkManager.shared
    
    private var word: WordModel = WordModel(word: "", entry: Word(definition: ""))
    
    unowned let presenter: SingleGamePresenterProtocol
    
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
    
    func getCurrentWord() -> WordModel {
        return word
    }
    
    func isValidLetter(_ letter: String) {
        var indexes: [Int] = []
        for (index, letterInWord) in word.word.enumerated() {
            if letter == String(letterInWord) {
                indexes.append(index)
            }
        }
        indexes.isEmpty ? presenter.takeTheHeart() : presenter.openTheLetter(at: indexes)
    }
    
}
