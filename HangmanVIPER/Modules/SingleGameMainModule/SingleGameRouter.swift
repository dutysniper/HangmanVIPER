//
//  SingleGameRouter.swift
//  HangmanVIPER
//
//  Created by Степан Фоминцев on 19.08.2023.
//

import UIKit

protocol SingleGameRouterProtocol: AnyObject {
    init(view: SingleGameMainScreenViewControllerProtocol, presenter: SingleGamePresenterProtocol)
    func closeTheView()
}

final class SingleGameRouter: SingleGameRouterProtocol {
    unowned var view: SingleGameMainScreenViewControllerProtocol
    unowned var presenter: SingleGamePresenterProtocol
    
    init(view: SingleGameMainScreenViewControllerProtocol, presenter: SingleGamePresenterProtocol) {
        self.view = view
        self.presenter = presenter
    }
    
    func closeTheView() {
        if let navigationController = UIApplication.shared.keyWindow?.rootViewController as? UINavigationController {
            navigationController.popViewController(animated: true)
        }
    }
}
