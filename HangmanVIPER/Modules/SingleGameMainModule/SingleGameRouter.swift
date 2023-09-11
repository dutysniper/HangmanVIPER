//
//  SingleGameRouter.swift
//  HangmanVIPER
//
//  Created by Степан Фоминцев on 19.08.2023.
//

import UIKit

protocol SingleGameRouterProtocol: AnyObject {
    init(view: SingleGameMainScreenViewControllerProtocol)
    // close()/closeView()
    func closeTheView()
    func reloadVC()
}

final class SingleGameRouter: SingleGameRouterProtocol {
    unowned var view: SingleGameMainScreenViewControllerProtocol
    
    init(view: SingleGameMainScreenViewControllerProtocol) {
        self.view = view
    }
    
    func closeTheView() {
        if let navigationController = UIApplication.shared.keyWindow?.rootViewController as? UINavigationController {
            navigationController.popViewController(animated: true)
        }
    }
    // перепушить контроллер для обновления экрана - практика не самая лучшая. Лучше подумать над обновлением UI руками, чем делать такое
    func reloadVC() {
        if let navigationController = UIApplication.shared.keyWindow?.rootViewController as? UINavigationController {
            navigationController.popViewController(animated: false)
            navigationController.pushViewController(SingleGameMainScreenViewController(), animated: false)
        }
    }
}
