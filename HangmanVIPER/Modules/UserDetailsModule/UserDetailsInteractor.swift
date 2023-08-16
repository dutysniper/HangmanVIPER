//
//  UserDetailsInteractor.swift
//  HangmanVIPER
//
//  Created by Константин Натаров on 16.08.2023.
//

import Foundation

protocol UserDetailsInteractorProtocol {
    
}

final class UserDetailsInteractor: UserDetailsInteractorProtocol {
    weak var presenter: UserDetailsPresenterProtocol!
    
    required init(presenter: UserDetailsPresenterProtocol) {
        self.presenter = presenter
    }
}
