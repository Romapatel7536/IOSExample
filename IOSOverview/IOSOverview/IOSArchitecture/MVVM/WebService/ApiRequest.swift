//
//  ApiRequest.swift
//  IOSOverview
//
//  Created by Roma Patel on 23/06/22.
//

import Foundation
import Alamofire

class APIRequest {
    
    func getUsers(completion: @escaping ([UserModel]) -> Void) {
        if let url = URL(string: "https://reqres.in/api/users?page=2") {
            AF.request(url).response { response in
                
                guard let data = response.data else { return }
                if(response.response?.statusCode == 200) {
                    do {
                        let result = try JSONDecoder().decode(UserResponse.self, from: data)
                        completion(result.data)
                        
                    } catch {
                        return
                    }
                }
            }
        }
    }
    
}
