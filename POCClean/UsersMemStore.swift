//
//  UsersMemStore.swift
//  POCClean
//
//  Created by Alejandro Rodriguez on 7/5/17.
//  Copyright © 2017 Alejandro Rodriguez. All rights reserved.
//

import Foundation


class UsersMemStore: UsersStoreProtocol{
    
    var users:[User] = []
    
    func saveUser(request: CreateUser.User.Request, completionHandler: (String) -> Void) {
        let user = User(firstName: request.firstName, lastName: request.lastName)
        users.append(user)
        completionHandler("Success")
    }
}
