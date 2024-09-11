//
//  RegisterRequestBody.swift
//  GroupExpense
//
//  Created by Janek Höricht on 11.09.24.
//

import Foundation

struct RegisterRequestBody : IApiRequestBody {
    let email : String
    let username : String
    let password1 : String
    let password2 : String
    
    init(email: String, username: String, password1: String, password2: String) {
        self.email = email
        self.username = username
        self.password1 = password1
        self.password2 = password2
    }
}
