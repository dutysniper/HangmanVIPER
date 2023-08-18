//
//  SingleGameRouter.swift
//  HangmanVIPER
//
//  Created by Степан Фоминцев on 19.08.2023.
//

import UIKit

protocol SingleGameRouterProtocol: AnyObject {
    init(view: SingleGameMainScreenViewController)
}

final class SingleGameRouter: SingleGameRouterProtocol {
    unowned var view: SingleGameMainScreenViewController
    
    init(view: SingleGameMainScreenViewController) {
        self.view = view
    }
}
