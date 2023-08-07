//
//  ViewController.swift
//  HangmanVIPER
//
//  Created by Константин Натаров on 29.07.2023.
//

import UIKit
import SwiftUI

protocol ModeSelectionViewInput: AnyObject {

}

protocol ModeSelectionViewOutput {
    init(view: ModeSelectionViewInput)
    func userSelectedMode()
}


class ModeSelectionView: UIViewController, ModeSelectionViewInput {
    let buttonFactory = ButtonFactory()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        let redButtonEntity = ModeSelectionButtonEntity(
            title: "Одиночная игра",
            titleColor: .white,
            backgroundColor: UIColor(red: 255/255, green: 0/255, blue: 0/255, alpha: 1.0)
        )

        let blueButtonEntity = ModeSelectionButtonEntity(
            title: "Мультиплеер",
            titleColor: .white,
            backgroundColor: UIColor(red: 0/255, green: 0/255, blue: 255/255, alpha: 1.0)
        )

        let redButton = buttonFactory.createButton(with: redButtonEntity)
        let blueButton = buttonFactory.createButton(with: blueButtonEntity)

        let buttonsStackView = UIStackView(arrangedSubviews: [redButton, blueButton])
        buttonsStackView.axis = .vertical
        buttonsStackView.alignment = .center
        buttonsStackView.spacing = 20

        view.addSubview(buttonsStackView)

        buttonsStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            buttonsStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            buttonsStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
}

//MARK: - SwiftUI Preview
@available(iOS 13.0, *)
struct ModeSelectionViewPreview: PreviewProvider {
    static var previews: some View {
        // Оборачиваем UIHostingController в SwiftUI представление
        ViewControllerWrapper()
            .edgesIgnoringSafeArea(.all)
            .previewDevice(PreviewDevice(rawValue: "iPhone 12"))
            .previewDisplayName("Mode Selection View")
    }
}

@available(iOS 13.0, *)
struct ViewControllerWrapper: UIViewControllerRepresentable {
    func makeUIViewController(context: UIViewControllerRepresentableContext<ViewControllerWrapper>) -> ModeSelectionView {
        let modeSelectionView = ModeSelectionView()
        return modeSelectionView
    }

    func updateUIViewController(_ uiViewController: ModeSelectionView, context: UIViewControllerRepresentableContext<ViewControllerWrapper>) {
        
    }
}

