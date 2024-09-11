//
//  LoginRequestBody.swift
//  GroupExpense
//
//  Created by Janek Höricht on 11.09.24.
//

import Foundation

struct LoginRequestBody : IApiRequestBody {
    let username : String
    let password : String
    
    init(username: String, password: String) {
        self.username = username
        self.password = password
    }
}
