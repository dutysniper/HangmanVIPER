//
//  ModeSelectionInteractor.swift
//  HangmanVIPER
//
//  Created by Константин Натаров on 29.07.2023.
//

protocol ModeSelectionInteractorProtocol {
    
}

final class ModeSelectionInteractor: ModeSelectionInteractorProtocol {
    weak var presenter: ModeSelectionPresenterProtocol!
    
    required init(presenter: ModeSelectionPresenterProtocol!) {
        self.presenter = presenter
    }
  
    }
