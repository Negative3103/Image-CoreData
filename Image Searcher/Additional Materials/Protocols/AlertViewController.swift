//
//  AlertViewController.swift
//  Image Searcher
//
//  Created by Хасан Давронбеков on 16/05/23.
//

import UIKit

protocol AlertViewController {
    func showAlert(title: String, message: String, buttonAction: (()->())?)
    func showAlertWithTwoButtons(title: String, message: String, firstButtonText: String, firstButtonAction: (()->())?, secondButtonText: String, secondButtonAction: (()->())?)
}

extension AlertViewController where Self: UIViewController {
    func showAlert(title: String, message: String, buttonAction: (()->())? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: { (action) in
            buttonAction?()
        }))
        DispatchQueue.main.async {
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    func showAlertWithTwoButtons(title: String, message: String, firstButtonText: String, firstButtonAction: (()->())? = nil, secondButtonText: String, secondButtonAction: (()->())? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: firstButtonText, style: UIAlertAction.Style.default, handler: { (action) in
            firstButtonAction?()
        }))
        alert.addAction(UIAlertAction(title: secondButtonText, style: UIAlertAction.Style.default, handler: { (action) in
            secondButtonAction?()
        }))
        DispatchQueue.main.async {
            self.present(alert, animated: true, completion: nil)
        }
    }
}
