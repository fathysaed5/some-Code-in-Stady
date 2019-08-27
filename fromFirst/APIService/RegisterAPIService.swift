//
//  RegisterAPIService.swift
//  fromFirst
//
//  Created by fathy  on 7/27/19.
//  Copyright © 2019 fathy . All rights reserved.
//

import Foundation
import Alamofire

class RegisterAPIService {
    static let instance = RegisterAPIService()
    func register(url: String, email: String, passord: String, name: String, phone: String, completion: @escaping (RegisterDataModel?, Error?)->()) {
        let parameters = ["lang": "", "fire_base_token": "dddd", "mobile": phone, "email": email, "password": passord, "name": name]
        let headers = ["Content-Type": "application/json"]
        Alamofire.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: headers).responseJSON { (response) in
            guard let data = response.data else { return }
            switch response.result {
                
            case .success(let value):
                do {
                    let registerData = try JSONDecoder().decode(RegisterDataModel.self, from: data)
                    completion(registerData, nil)
                } catch let jsonError {
                    print(jsonError)
                }
            case .failure(let error):
                completion(nil, error)
            }
        }
    }
}
