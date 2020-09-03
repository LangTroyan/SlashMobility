//
//  OriginDTO.swift
//  dylan.trujillo
//
//  Created by Lang Troyan on 02/09/2020.
//  Copyright © 2020 Dylan Trujillo. All rights reserved.
//

import Foundation

class OriginDTO: Codable {
    enum CodingKeys: String, CodingKey {
        case origin
    }
    
    var origin: String
    
    init(_ origin: String) {
        self.origin = origin
    }
}
