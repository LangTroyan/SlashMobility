//
//  MainScreenViewController.swift
//  dylan.trujillo
//
//  Created by Lang Troyan on 02/09/2020.
//  Copyright © 2020 Dylan Trujillo. All rights reserved.
//

import UIKit

class MainScreenViewController: UIViewController {

    // MARK: Outlets
    
    @IBOutlet weak var callServiceButton: UIButton!
    @IBOutlet weak var goToListButton: UIButton!
    @IBOutlet weak var responseTitleLabel: UILabel!
    @IBOutlet weak var responseLabel: UILabel!
    @IBOutlet weak var reverseResponseTitleLabel: UILabel!
    @IBOutlet weak var reverseResponseLabel: UILabel!
    
    // MARK: Properties
    
    var viewModel: MainScreenViewModel?
    
    // MARK: UIViewController methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }
    
    private func configureView() {
        viewModel = MainScreenViewModel()
        callServiceButton.setTitle(LocaleKeys.mainscreen_call_service_button.localized.uppercased(), for: .normal)
        goToListButton.setTitle(LocaleKeys.mainscreen_go_to_list_button.localized.uppercased(), for: .normal)
        responseTitleLabel.text = LocaleKeys.mainscreen_response.localized
        reverseResponseTitleLabel.text = LocaleKeys.mainscreen_response.localized
    }

    // MARK: Class methods
    
    private func showOrigin() {
        guard let origin = viewModel?.origin?.origin else { return }
        responseLabel.text = origin
        responseLabel.isHidden = false
        reverseResponseLabel.text = String(origin.reversed())
        reverseResponseLabel.isHidden = false
    }
    
    @IBAction func pressCallService() {
        guard let viewModel = viewModel else { return }
        showSpinner(onView: view)
        viewModel.loadOrigin(successHandler: {
            self.removeSpinner()
            DispatchQueue.main.async {
                self.showOrigin()
            }
        }, errorHandler: { (message) in
            self.removeSpinner()
            self.showAlertWith(title: LocaleKeys.error_title.localized, message: message, completition: {
                return
            })
        })
    }

}

