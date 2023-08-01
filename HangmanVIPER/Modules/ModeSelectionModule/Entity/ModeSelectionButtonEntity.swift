//
//  ModeSelectionEntity.swift
//  HangmanVIPER
//
//  Created by Константин Натаров on 29.07.2023.
//

import UIKit

protocol ButtonEntityProtocol {
    var title: String { get }
    var titleColor: UIColor { get }
    var backgroundColor: UIColor { get }
}

struct ModeSelectionButtonEntity: ButtonEntityProtocol {
    var title: String
    var titleColor: UIColor
    var backgroundColor: UIColor
}
