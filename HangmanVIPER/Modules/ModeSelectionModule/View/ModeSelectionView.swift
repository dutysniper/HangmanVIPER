//
//  ViewController.swift
//  HangmanVIPER
//
//  Created by Константин Натаров on 29.07.2023.
//

import UIKit
import SwiftUI

protocol ModeSelectionViewProtocol: AnyObject {
    
}


class ModeSelectionView: UIViewController, ModeSelectionViewProtocol {
    var presenter: ModeSelectionPresenterProtocol!
    var configurator: ModeSelectionConfiguratorProtocol = ModeSelectionConfigurator()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configurator.configure(with: self)
//        presenter.configureView()
        setupButtons()
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

//MARK: - Setup UI
private extension ModeSelectionView {
    func setupButtons() {
        let buttonFactory = ButtonFactory()
        
        let redButton = buttonFactory.createButton(title: "Одиночная игра", titleColor: .white, backgroundColor: .red)
        let blueButton = buttonFactory.createButton(title: "Играть по сети", titleColor: .white, backgroundColor: .blue)
        
        redButton.addTarget(self, action: #selector(startSingleGame), for: .touchUpInside)
        
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
    
    @objc func startSingleGame() {
        presenter.singlePlayerButtonClicked()
    }
}
