//
//  ButtonFactory.swift
//  HangmanVIPER
//
//  Created by Константин Натаров on 29.07.2023.
//

import UIKit

final class ButtonFactory {
    public func createButton(with entity: ButtonEntityProtocol) -> UIButton {
        let button = UIButton()
        
        button.setTitle(entity.title, for: .normal)
        button.tintColor = entity.titleColor
        button.backgroundColor = entity.backgroundColor
        return button
    }
}
