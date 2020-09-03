//
//  APIService.swift
//  Myth Quiz
//
//  Created by Trujillo Baez, Dylan Alfonso (ES - Barcelona) on 04/09/2019.
//  Copyright © 2019 Dylan Trujillo. All rights reserved.
//

import UIKit

enum Result<T>{
    case Success(T)
    case Error(String)
}

class APIService: NSObject {
    
    //MARK: Properties
    let baseUrl: String = "https://httpbin.org/get"
    
    //MARK: Method
    func getData<T: Codable>(type: T.Type, completition: @escaping (Result<T>) -> Void){
        guard let url = URL(string: baseUrl) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else {
                return completition(.Error(error?.localizedDescription ?? LocaleKeys.error_no_data.localized))
            }
            let decoder = JSONDecoder()
            do {
                let response = try decoder.decode(T.self, from: data)
                completition(.Success(response))
            }
            catch let error {
                return completition(.Error(error.localizedDescription))
            }
        }.resume()
    }
}
