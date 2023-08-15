//
//  ViewController.swift
//  HangmanVIPER
//
//  Created by Константин Натаров on 29.07.2023.
//

import UIKit
import SwiftUI

// MARK: взимодействие презентера со вью через этот протокол
protocol ModeSelectionViewProtocol: AnyObject {
    func setupButtons()
}

// MARK: ModeSelectionViewController!!!
final class ModeSelectionViewController: UIViewController, ModeSelectionViewProtocol {
    var presenter: ModeSelectionPresenterProtocol!
    var configurator: ModeSelectionConfiguratorProtocol = ModeSelectionConfigurator()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white // MARK: Тоже стоит засунуть в метод setupButtons(который по хорошему можно переименовать в setupView()
        configurator.configure(with: self)
        presenter.configureView()
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
    func makeUIViewController(context: UIViewControllerRepresentableContext<ViewControllerWrapper>) -> ModeSelectionViewController {
        let modeSelectionView = ModeSelectionViewController()
        return modeSelectionView
    }

    func updateUIViewController(_ uiViewController: ModeSelectionViewController, context: UIViewControllerRepresentableContext<ViewControllerWrapper>) {
        
    }
}

//MARK: - Setup UI
extension ModeSelectionViewController {
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
    
    @objc func startSingleGame(sender: UIButton) {
        animateButtonTap(sender: sender) {
            self.presenter.singlePlayerButtonClicked()
        }
    }
    
    func animateButtonTap(sender: UIButton, completion: @escaping () -> Void) {
           let originalTransform = sender.transform
           
           UIView.animate(withDuration: 0.2, animations: {
               sender.transform = originalTransform.scaledBy(x: 0.9, y: 0.9)
           }) { _ in
               UIView.animate(withDuration: 0.1) {
                   sender.transform = originalTransform
               }
               completion()
           }
       }
}
