//
//  ModeSelectionRouter.swift
//  HangmanVIPER
//
//  Created by Константин Натаров on 29.07.2023.
//

import UIKit

protocol ModeSelectionRouterProtocol {
    func openSingleGameScreen()
}

final class ModeSelectionRouter: ModeSelectionRouterProtocol {
    weak var view: ModeSelectionView!
    
    required init(view: ModeSelectionView) {
        self.view = view
    }
    
    func openSingleGameScreen() {
        if let navigationController = UIApplication.shared.keyWindow?.rootViewController as? UINavigationController {
            navigationController.pushViewController(SingleGameMainScreenView(), animated: true)
        }
    }
    
    
}
