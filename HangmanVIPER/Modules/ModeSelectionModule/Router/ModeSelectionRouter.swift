//
//  ModeSelectionRouter.swift
//  HangmanVIPER
//
//  Created by Константин Натаров on 29.07.2023.
//

import UIKit

protocol ModeSelectionRouterProtocol {
    func openSingleGameScreen()
    func openDetailsUserInfo()
}

final class ModeSelectionRouter: ModeSelectionRouterProtocol {
    weak var view: ModeSelectionViewController!
    
    required init(view: ModeSelectionViewController) {
        self.view = view
    }
    
    func openSingleGameScreen() {
        if let navigationController = UIApplication.shared.keyWindow?.rootViewController as? UINavigationController {
            navigationController.pushViewController(SingleGameMainScreenViewController(), animated: true)
        }
    }
    func openDetailsUserInfo() {
        if let navigationController = UIApplication.shared.keyWindow?.rootViewController as?
            UINavigationController {
            navigationController.pushViewController(UserDetailsViewController(), animated: true)
        }
    }
    
    
}
