//
//  SingleGameMainScreenView.swift
//  HangmanVIPER
//
//  Created by Константин Натаров on 09.08.2023.
//

import UIKit

final class SingleGameMainScreenViewController: UIViewController {
    let letterButtons = LetterButtonsFactory().createLetterButtons()
    let hangmanImage = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
        testMockEntity()
        setupLettersButtons()
        setupHangmanImage()
        
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
        wordDefinition.isHidden = true // скрытие подсказки
        
        labelsStackView.axis = .vertical
        labelsStackView.alignment = .center
        labelsStackView.spacing = 20
        
        view.addSubview(labelsStackView)
        
        labelsStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            labelsStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            labelsStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            labelsStackView.widthAnchor.constraint(equalToConstant: 400)
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
    private func setupLettersButtons() {
        let letterButtons = LetterButtonsFactory().createLetterButtons()
        
        let verticalStackView = UIStackView()
        verticalStackView.axis = .vertical
        verticalStackView.alignment = .center
        verticalStackView.spacing = 4
        
        var horizontalStackView: UIStackView?
        var buttonsInCurrentRow = 0
        
        for (index, letterButton) in letterButtons.enumerated() {
            if buttonsInCurrentRow == 0 {
                horizontalStackView = UIStackView()
                horizontalStackView?.axis = .horizontal
                horizontalStackView?.alignment = .center
                horizontalStackView?.spacing = 4
            }
            
            horizontalStackView?.addArrangedSubview(letterButton)
            buttonsInCurrentRow += 1
            
            if buttonsInCurrentRow == 9 || index == letterButtons.count - 1 {
                verticalStackView.addArrangedSubview(horizontalStackView!)
                buttonsInCurrentRow = 0
            }
        }
        
        view.addSubview(verticalStackView)
        
        verticalStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(
            [
                verticalStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                verticalStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                verticalStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50)
            ]
        )
    }
    private func setupHangmanImage() {
        hangmanImage.image = UIImage(named: "hangman1")
        
        hangmanImage.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(hangmanImage)
        NSLayoutConstraint.activate(
            [
                hangmanImage.widthAnchor.constraint(equalToConstant: 400),
                hangmanImage.heightAnchor.constraint(equalToConstant: 400),
                hangmanImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                hangmanImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 30)
        ]
        )
    }
}
