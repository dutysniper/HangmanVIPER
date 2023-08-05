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
        button.setTitleColor(entity.titleColor, for: .normal) 
        button.backgroundColor = entity.backgroundColor
        button.layer.cornerRadius = 12
        button.layer.masksToBounds = true
        button.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        button.widthAnchor.constraint(equalToConstant: 150).isActive = true
        button.widthAnchor.constraint(lessThanOrEqualToConstant: 400).isActive = true
        return button
    }
}
