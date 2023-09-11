//
//  GameOverView.swift
//  HangmanVIPER
//
//  Created by Константин Натаров on 30.08.2023.
//

import UIKit

final class GameOverView: UIView {
    private let gameResultLabel = UILabel()
    private let gameResultLabelText: String
    private let exitButtonAction: () -> Void
    private let newGameButtonAction: () -> Void
    
    init(frame: CGRect, gameResultLabelText: String, exitAction: @escaping () -> Void, newGameAction: @escaping () -> Void) {
        self.exitButtonAction = exitAction
        self.newGameButtonAction = newGameAction
        self.gameResultLabelText = gameResultLabelText
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        backgroundColor = .orange
        layer.cornerRadius = 20
        frame.size = CGSize(width: 250, height: 250)
        setupLabel(with: gameResultLabelText)
        setupButtons()
    }
    
    private func setupButtons() {
        let buttonFactory = ButtonFactory()
        
        let exitButton = buttonFactory.createButton(title: "Главное меню", titleColor: .white, backgroundColor: .red)
        let newGameButton = buttonFactory.createButton(title: "Новое слово", titleColor: .white, backgroundColor: .blue)
        
        exitButton.addTarget(self, action: #selector(exitButtonTapped), for: .touchUpInside)
        newGameButton.addTarget(self, action: #selector(newGameButtonTapped), for: .touchUpInside)
        
        // Add buttons to the view
        addSubview(newGameButton)
        addSubview(exitButton)
        
        // Add constraints for the buttons
        exitButton.translatesAutoresizingMaskIntoConstraints = false
        newGameButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            newGameButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            newGameButton.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 30),
            
            exitButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            exitButton.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -30),
        ])
    }
    
    private func setupLabel(with text: String) {
        gameResultLabel.text = text
        gameResultLabel.textColor = .white
        
        addSubview(gameResultLabel)
        gameResultLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(
            [
                gameResultLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
                gameResultLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ]
        )
    }
    
    @objc private func exitButtonTapped() {
        exitButtonAction()
    }
    
    @objc private func newGameButtonTapped() {
        newGameButtonAction()
    }
}
