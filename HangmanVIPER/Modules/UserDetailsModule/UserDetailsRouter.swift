//
//  UserDetailsRouter.swift
//  HangmanVIPER
//
//  Created by Константин Натаров on 16.08.2023.
//

import Foundation

protocol UserDetailsRouterProtocol {
    
}

final class UserDetailsRouter: UserDetailsRouterProtocol {
    weak var viewController: UserDetailsViewController!
    
    required init(viewController: UserDetailsViewController) {
        self.viewController =  viewController
    }
}
