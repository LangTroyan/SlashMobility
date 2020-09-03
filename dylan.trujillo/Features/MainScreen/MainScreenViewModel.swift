//
//  MainScreenViewModel.swift
//  dylan.trujillo
//
//  Created by Lang Troyan on 02/09/2020.
//  Copyright © 2020 Dylan Trujillo. All rights reserved.
//

import Foundation

class MainScreenViewModel {
    
    // MARK: Properties
    
    private var api: APIService?
    var origin: OriginDTO?
    
    // MARK: Class methods
    
    public func loadOrigin(successHandler: @escaping () -> Void, errorHandler: @escaping (String) -> Void){
        let service = APIService()
        service.getData(type: OriginDTO.self){ (result) in
            switch result {
            case .Success(let data):
                self.origin = data
                successHandler()
            case .Error(let message):
                errorHandler(message)
            }
        }
    }
}
