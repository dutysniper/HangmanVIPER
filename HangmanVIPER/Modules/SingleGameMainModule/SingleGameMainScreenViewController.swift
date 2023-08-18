//
//  SingleGameMainScreenView.swift
//  HangmanVIPER
//
//  Created by Константин Натаров on 09.08.2023.
//

import UIKit

protocol SingleGameMainScrennViewControllerProtocol {
    func setupUI(withWord word: WordModel)
}

final class SingleGameMainScreenViewController: UIViewController {

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
extension SingleGameMainScreenViewController: SingleGameMainScrennViewControllerProtocol {
    func setupUI(withWord word: WordModel) {
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
}
