//
//  ViewController.swift
//  HangmanVIPER
//
//  Created by Константин Натаров on 29.07.2023.
//

import UIKit

protocol ModeSelectionViewInput: AnyObject {

}

protocol ModeSelectionViewOutput {
    init(view: ModeSelectionViewInput)
    func userSelectedMode()
}

final class ModeSelectionView: UIViewController, ModeSelectionViewInput {
    let buttonFactory = ButtonFactory()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        let redButtonEntity = ModeSelectionButtonEntity(
            title: "Одиночная игра",
            titleColor: .black,
            backgroundColor: .yellow
        )
        let blueButtonEntity = ModeSelectionButtonEntity(
            title: "Мультиплеер",
            titleColor: .black,
            backgroundColor: .yellow
        )
        let redButton = buttonFactory.createButton(with: redButtonEntity)
        let blueButton = buttonFactory.createButton(with: blueButtonEntity)
        
        let buttonsStackView = UIStackView(arrangedSubviews: [redButton, blueButton])
        buttonsStackView.axis = .vertical
        buttonsStackView.alignment = .center
        buttonsStackView.spacing = 20
        
        view.addSubview(buttonsStackView)
        
        buttonsStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(
            [
                buttonsStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
                buttonsStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ]
        )
//        setupNavigationBar()
    }
}

//MARK: - SetupUI
private extension ModeSelectionView {
//    func setupNavigationBar() {
//        title = "Режим игры"
//        navigationController?.navigationBar.prefersLargeTitles = true
//
//        let navBarAppearance = UINavigationBarAppearance()
//        navBarAppearance.backgroundColor = UIColor(
//            red: 21/255,
//            green: 101/255,
//            blue: 192/255,
//            alpha: 194/255
//        )
//
//        navigationController?.navigationBar.scrollEdgeAppearance = navBarAppearance
//    }
}
