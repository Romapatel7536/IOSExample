//
//  Intractor.swift
//  IOSOverview
//
//  Created by Roma Patel on 24/06/22.
//

import UIKit
import Alamofire

// MARK: - IPresenter Protocol
protocol IViperIntractor {
    var presenter: IViperPresenter? { get set }
    func getUsers()
}

// MARK: - MVPPresentor Class
class ViperIntractor: IViperIntractor {
    
    // MARK: - Protocol Stubs Variable
    var presenter: IViperPresenter?
    
    // MARK: - Protocol Stubs Function
    func getUsers() {
        if let url = URL(string: "https://reqres.in/api/users?page=2") {
            AF.request(url).response { response in
                
                guard let data = response.data else { return }
                if(response.response?.statusCode == 200) {
                    do {
                        let result = try JSONDecoder().decode(UserResponse.self, from: data)
                        self.presenter?.onSuccess(resultData: result)
                        
                    } catch (let errorMessage) {
                        self.presenter?.onFailure(error: "Not Able to Convert JSON Data \(errorMessage).")
                        return
                    }
                } else {
                    self.presenter?.onFailure(error: "\(response.response?.statusCode ?? 0) Data Not Found.")
                }
            }
        }
    }
    
}
