//
//  SingleGameMainScreenView.swift
//  HangmanVIPER
//
//  Created by Константин Натаров on 09.08.2023.
//

import UIKit

final class SingleGameMainScreenViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
        testMokEntity()
    }
}

func testMokEntity() {
    let networkManager = NetworkManager.shared
    networkManager.getRandomWord(fileName: "wordListWithDefinition") { word in
        if let randomWord = word {
            print("Random word: \(randomWord.word)")
        } else {
            print("No random word available.")
        }
    }
}
