//
//  ButtonFactory.swift
//  HangmanVIPER
//
//  Created by Константин Натаров on 29.07.2023.
//

import UIKit

final class ButtonFactory {
    
    func createButton(title: String, titleColor: UIColor, backgroundColor: UIColor) -> UIButton {
        let button = UIButton()
        
        button.setTitle(title, for: .normal)
        button.setTitleColor(titleColor, for: .normal)
        button.backgroundColor = backgroundColor
        button.layer.cornerRadius = 12
        button.layer.masksToBounds = true
        button.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        button.widthAnchor.constraint(equalToConstant: 150).isActive = true
        button.widthAnchor.constraint(lessThanOrEqualToConstant: 400).isActive = true
        button.layer.cornerRadius = 12
        button.layer.masksToBounds = false // Разрешим тень выходить за пределы кнопки
        button.layer.shadowColor = UIColor.gray.cgColor
        button.layer.shadowOpacity = 0.8
        button.layer.shadowOffset = CGSize(width: 0, height: 4)
        button.layer.shadowRadius = 6
        return button
    }
}
