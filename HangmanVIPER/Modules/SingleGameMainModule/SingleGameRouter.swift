//
//  SingleGameRouter.swift
//  HangmanVIPER
//
//  Created by Степан Фоминцев on 19.08.2023.
//

import UIKit

protocol SingleGameRouterProtocol: AnyObject {
    init(view: SingleGameMainScreenViewController, presenter: SingleGamePresenter)
}

final class SingleGameRouter: SingleGameRouterProtocol {
    unowned var view: SingleGameMainScreenViewController
    unowned var presenter: SingleGamePresenter
    
    init(view: SingleGameMainScreenViewController, presenter: SingleGamePresenter) {
        self.view = view
        self.presenter = presenter
    }
}
