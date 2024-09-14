//
//  RegisterRequest.swift
//  GroupExpense
//
//  Created by Janek Höricht on 14.09.24.
//

import Foundation

struct RegisterRequest : IAuthRequest {
    let apiKey: String = "/auth/register"
    let httpMethod: String = "POST"
    
    var body: RegisterRequestBody
    
    init(body: RegisterRequestBody) {
        self.body = body
    }
}

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

