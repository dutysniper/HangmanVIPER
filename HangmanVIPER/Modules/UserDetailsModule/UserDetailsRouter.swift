//
//  UserDetailsRouter.swift
//  HangmanVIPER
//
//  Created by Константин Натаров on 16.08.2023.
//

import UIKit


protocol UserDetailsRouterProtocol {
    func showImagePickerController()
}

final class UserDetailsRouter: NSObject, UserDetailsRouterProtocol {
    weak var viewController: UserDetailsViewController! //Тут классы или протоколы должны быть?
    weak var presenter: UserDetailsPresenter!           //Тут классы или протоколы должны быть?
    
    required init(viewController: UserDetailsViewController, presenter: UserDetailsPresenter) {
        self.viewController =  viewController
        self.presenter = presenter
    }
    
    //MARK: - Present ImagePickerVC
    func showImagePickerController() {
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        imagePickerController.sourceType = .photoLibrary
        viewController.present(imagePickerController, animated: true, completion: nil)
    }
}

//MARK: - UIImagePickerControllerDelegate methods
extension UserDetailsRouter: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        print("обработка выбора фото")
        if let selectedImage = info[.originalImage] as? UIImage {
            print("обработка выбора фото с условием")
            presenter?.imagePicked(selectedImage)
        }
        picker.dismiss(animated: true, completion: nil)
    }

    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        print("закрытие пикера без выбора")
        picker.dismiss(animated: true, completion: nil)
    }
}
