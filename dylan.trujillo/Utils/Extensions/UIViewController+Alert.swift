//
//  UIViewController+Alert.swift
//
//
//  Created by Trujillo Baez, Dylan Alfonso (ES - Barcelona)
//  Copyright © 2019 Dylan Trujillo. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    func showAlertWith(title: String, message: String, style: UIAlertController.Style = .alert) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: style)
        let action = UIAlertAction(title: LocaleKeys.ok.localized.uppercased(), style: .default, handler: nil)
        alertController.addAction(action)
        self.present(alertController, animated: true, completion: nil)
    }
    func showAlertWith(title: String, message: String, style: UIAlertController.Style = .alert, completition: @escaping () -> Void) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: style)
        let action = UIAlertAction(title: LocaleKeys.ok.localized.uppercased(), style: .default){
            (action) in
            completition()
        }
        alertController.addAction(action)
        DispatchQueue.main.async {
             self.present(alertController, animated: true, completion: nil)
        }
    }
}
