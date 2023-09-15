//
//  UI for SinglePlayer Screen.swift
//  HangmanVIPER
//
//  Created by Константин Натаров on 18.08.2023.
//

import UIKit

final class LetterButtonsFactory {
    private let letters = ["а", "б", "в", "г", "д", "е", "ё", "ж", "з", "и", "й", "к", "л", "м", "н", "о", "п", "р", "с", "т", "у", "ф", "х", "ц", "ч", "ш", "щ", "ъ", "ы", "ь", "э", "ю", "я"]
    func createLetterButtons() -> [UIButton] {
        var letterButtons: [UIButton] = []
        letters.forEach { letter in
            let letterButton  = UIButton()
            letterButton.setTitle(letter, for: .normal)
            letterButton.backgroundColor = .none
            letterButton.setTitleColor(.black, for: .normal)
            letterButtons.append(letterButton)
            letterButton.titleLabel?.font = UIFont(name: "Supercell-Magic", size: 25)
        }
        return letterButtons
    }
}
