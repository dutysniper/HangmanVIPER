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
    let mokEntity = ModeSelectionButtonEntity(
        title: "Hello",
        titleColor: .black,
        backgroundColor: .gray
    )
    private let containerView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(containerView)
        let button = buttonFactory.createButton(with: mokEntity)
        containerView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(
            [
                containerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                containerView.centerYAnchor.constraint(equalTo: view.centerYAnchor)]
        )
        containerView.addSubview(button)
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
