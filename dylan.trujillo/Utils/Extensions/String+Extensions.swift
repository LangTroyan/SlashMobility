//
//  String+Extensions.swift
//  dylan.trujillo
//
//  Created by dtrujillobaez on 03/09/2020.
//  Copyright © 2020 Dylan Trujillo. All rights reserved.
//

import Foundation

extension String {
    func localized(using tableName: String? = nil, in bundle: Bundle? = nil) -> String {
        return NSLocalizedString(self, comment: "")
    }
}
