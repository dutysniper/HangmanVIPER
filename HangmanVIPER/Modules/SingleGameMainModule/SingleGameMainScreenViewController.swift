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
//        testMokEntity()
        testMockEntity()
        
    }
}


//MARK: - Setup MOK UI
extension SingleGameMainScreenViewController {
    private func setupUI(with word: WordModel) {
        let wordLabel = UILabel()
        let wordDefinition = UILabel()
        let labelsStackView = UIStackView(arrangedSubviews: [wordLabel, wordDefinition])
        
        wordLabel.text = word.word
        wordLabel.font = UIFont.systemFont(ofSize: 30)
        wordDefinition.text = word.entry.definition
        wordDefinition.numberOfLines = 0
        
        labelsStackView.axis = .vertical
        labelsStackView.alignment = .center
        labelsStackView.spacing = 20
        
        view.addSubview(labelsStackView)
        
        labelsStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            labelsStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            labelsStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            labelsStackView.widthAnchor.constraint(equalToConstant: 350)
        ])
    }
   private func testMockEntity() {
        let networkManager = NetworkManager.shared
        networkManager.fetchRandomWord(fileName: "wordListWithDefinition") { result in
            switch result {
            case .success(let word):
                print(word.word)
                self.setupUI(with: word)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}