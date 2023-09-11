//
//  SingleGameMainScreenView.swift
//  HangmanVIPER
//
//  Created by Константин Натаров on 09.08.2023.
//

import UIKit

protocol SingleGameMainScreenViewControllerProtocol: AnyObject {
    func setupUI(with word: WordModel)
    func openTheLetter(_ word: String)
    func takeTheHeart()
    func showGameOverViewWith(result: Bool)
    func resetUI()

}

final class SingleGameMainScreenViewController: UIViewController {
    private let hangmanImage = UIImageView()
    private let lifeImage = UIImageView()
    private let wordLabel = UILabel()
    private let wordDefinition = UILabel()
    
    
    
    
    
    //MARK: - stackView's
    private var letterButtonsStackView: UIStackView!
    private var lifeImagesStackView: UIStackView!
    
    var presenter: SingleGamePresenterProtocol!
    let configurator: SingleGameConfiguratorProtocol = SingleGameConfigurator()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
        configurator.configure(withView: self)
        presenter.configureView()
        
    }
}


//MARK: - Setup MOK UI
extension SingleGameMainScreenViewController: SingleGameMainScreenViewControllerProtocol {
    
    func setupUI(with word: WordModel) {
        setupWord(with: word)
        setupLettersButtons()
        setupHangmanImage()
        setupLifes()
    }
    
    func restartGame() {
        presenter.reloadUI()
    }
    
    func exitToMainMenu() {
        presenter.goToMainMenu()
    }
    
    func setupWord(with word: WordModel) {
        let labelsStackView = UIStackView(arrangedSubviews: [wordLabel, wordDefinition])
        
        wordLabel.text = word.word.map { _ in "_" }.joined(separator: " ")
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
    
    private func setupLettersButtons() {
        let letterButtons = LetterButtonsFactory().createLetterButtons()
        
        letterButtons.forEach {
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(letterPressed(_ :)))
            $0.addGestureRecognizer(tapGesture)
        }
        
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
        letterButtonsStackView = verticalStackView
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
    
    private func setupLifes() {
        var lifes: [UIImageView] = []
        
        for _ in 1...7 {
            let lifeImage = UIImageView()
            lifeImage.image = UIImage(systemName: "heart.fill")
            lifeImage.tintColor = .systemRed
            lifeImage.frame.size = CGSize(width: 10, height: 10)
            lifes.append(lifeImage)
        }
        
        let lifesStackView = UIStackView(arrangedSubviews: lifes)
        lifesStackView.axis = .horizontal
        lifesStackView.spacing = 5
        lifesStackView.alignment = .leading
        
        lifesStackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(lifesStackView)
        NSLayoutConstraint.activate(
            [
                lifesStackView.leadingAnchor.constraint(equalTo: letterButtonsStackView.leadingAnchor, constant: 70),
                lifesStackView.bottomAnchor.constraint(equalTo: letterButtonsStackView.topAnchor, constant: 8)
            ]
        )
        lifeImagesStackView = lifesStackView
    }
    
    func showGameOverViewWith(result: Bool) {
        let gameOverView = GameOverView(
            frame: CGRect(x: 400, y: 400, width: 400, height: 400),
            gameResultLabelText: result ? "Победа!" : "Поражение!",
            exitAction: exitToMainMenu,
            newGameAction: restartGame
        )
        
        // Некликабельный фон
        let backgroundView = UIView(frame: UIScreen.main.bounds)
        backgroundView.backgroundColor = UIColor(white: 1, alpha: 0.5)
        view.addSubview(backgroundView)
        
        gameOverView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(gameOverView)
        NSLayoutConstraint.activate(
            [
                gameOverView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                gameOverView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
                gameOverView.widthAnchor.constraint(equalToConstant: 250),
                gameOverView.heightAnchor.constraint(equalToConstant: 250)
            ]
        )
        UIView.animate(withDuration: 0.5) {
            gameOverView.frame.origin.y = self.view.frame.height - gameOverView.frame.height
        }
    }
}



// MARK: - business
extension SingleGameMainScreenViewController {
    
    // Срабатывает по нажатию кнопки
    @objc
    func letterPressed(_ sender: UITapGestureRecognizer) {
        guard let button = sender.view as? UIButton else { return }
        guard let letter = button.currentTitle else { return }
        presenter.letterPressed(letter)
        button.isEnabled = false
        button.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.07267296393)
        button.layer.cornerRadius = min(button.bounds.width, button.bounds.height) / 2
        button.layer.masksToBounds = true
        
        UIView.animate(withDuration: 0.5, animations: {
            button.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
        }) { _ in
            UIView.animate(withDuration: 0.5) {
                button.transform = CGAffineTransform.identity
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            UIButton.animate(withDuration: 0.5, animations: {
                button.alpha = 0.0
            })
        }
    }
    
    // Вызывается из презентера, открывает букву(-ы)
    func openTheLetter(_ word: String) {
        wordLabel.text = word
    }
    
    // Забирает сердечко
    func takeTheHeart() {
        guard let lifeImagesStackView else { return }
        lifeImagesStackView.forLastBaselineLayout.removeFromSuperview()
    }
    
    func resetUI() {
        view.subviews.forEach { subview in
            subview.removeFromSuperview()
        }
    }
    
}
