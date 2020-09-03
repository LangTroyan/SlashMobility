//
//  ListCell.swift
//  dylan.trujillo
//
//  Created by dtrujillobaez on 03/09/2020.
//  Copyright © 2020 Dylan Trujillo. All rights reserved.
//

import UIKit

class ListCell: UITableViewCell {
    
    // MARK: Outlets
    
    @IBOutlet weak var background: UIView!
    @IBOutlet weak var numberLabel: UILabel!
    
    // MARK: Properties
    
    static let identifier: String = "listCell"
    
    // MARK: Class methods
    
    func setNumber(_ number: Int) {
        numberLabel.text = String(number)
    }
    
    func setBackgroundColor(_ color: UIColor) {
        background.backgroundColor = color
    }
}
