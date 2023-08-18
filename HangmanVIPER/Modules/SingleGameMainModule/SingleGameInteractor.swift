//
//  SingleGameInteractor.swift
//  HangmanVIPER
//
//  Created by Степан Фоминцев on 17.08.2023.
//

import Foundation

protocol SingleGameInteractorProtocol: AnyObject {
    init(presenter: SingleGamePresenterProtocol)
    func getWord(completion: @escaping (WordModel) -> Void)
}

class SingleGameInteractor: SingleGameInteractorProtocol {
    private let networkManager = NetworkManager.shared
    let presenter: SingleGamePresenterProtocol
    
    required init(presenter: SingleGamePresenterProtocol) {
        self.presenter = presenter
    }
    
    func getWord(completion: @escaping (WordModel) -> Void) {
        networkManager.fetchRandomWord(fileName: "wordListWithDefinition") { result in
            switch result {
            case .success(let word):
                print(word.word)
                completion(word)
            case .failure(let error):
                fatalError(error.localizedDescription)
            }
        }
    }
    
    
}
