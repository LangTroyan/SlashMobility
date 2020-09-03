//
//  UIViewController+Spinner.swift
//  
//
//  Created by Trujillo Baez, Dylan Alfonso (ES - Barcelona)
//  Copyright © 2019 Dylan Trujillo. All rights reserved.
//

import UIKit

var viewSpinner: UIView?

extension UIViewController {
    func showSpinner(onView : UIView) {
        let spinnerView = UIView.init(frame: onView.bounds)
        spinnerView.backgroundColor = UIColor.init(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.5)
        let ai = UIActivityIndicatorView.init(style: UIActivityIndicatorView.Style.large)
        ai.startAnimating()
        ai.center = spinnerView.center
        
        DispatchQueue.main.async {
            spinnerView.addSubview(ai)
            onView.addSubview(spinnerView)
        }
        
        viewSpinner = spinnerView
    }
    
    func removeSpinner() {
        DispatchQueue.main.async {
            viewSpinner?.removeFromSuperview()
            viewSpinner = nil
        }
    }
}
