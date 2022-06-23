//
//  UserViewModel.swift
//  IOSOverview
//
//  Created by Roma Patel on 23/06/22.
//

import Foundation

class UsersViewModel {
    
    public static let instance = UsersViewModel()
    private var apiRequest: APIRequest!
    private(set) var users: [UserModel]! {
        didSet {
            self.bindViewModelToController(users)
        }
    }
    
    var bindViewModelToController : (([UserModel]) -> ()) = { users in }
    
    init() {
        self.apiRequest = APIRequest()
        apiRequest.getUsers{ users in
            self.users = users
        }
    }
    
}

