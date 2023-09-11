//
//  SingleGameEntity.swift
//  HangmanVIPER
//
//  Created by Константин Натаров on 15.08.2023.
//

import Foundation

struct SingleGameEntity {
    let word: WordModel
    let gameResult: GameResult
    
    init(word: WordModel, gameResult: GameResult) {
        self.word = word
        self.gameResult = gameResult
    }
}
// для сетевых моделей все поля лучше использовать как опциональные типы. Даже если контракт не предусматривает наличие опционального типа данных
struct Word: Codable {
    let definition: String
}

struct WordModel: Codable {
    let word: String
    let entry: Word
}


enum GameResult: CaseIterable {
    case win(
        name: String,
        details: String,
        winImage: String)
    case defeat(
        name: String,
        details: String,
        defeatImage: String
    )
    
    static var allCases: [GameResult] {
        return [
            .win(
                name: "Успех",
                details: "Вас не остановить! Вы успешно угадали слово и остановили палача",
                winImage: "SingleWin"
            ),
            .defeat(
                name: "Поражение",
                details: "На этот раз удача отвернулась от вас",
                defeatImage: "SingleDefeat"
            )
        ]
    }
}
