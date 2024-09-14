//
//  LoginRequest.swift
//  GroupExpense
//
//  Created by Janek Höricht on 14.09.24.
//

import Foundation

struct LoginRequest : IAuthRequest {
    let apiKey: String = "/auth/login"
    let httpMethod: String = "POST"
    
    var body: LoginRequestBody
    
    init(body: LoginRequestBody) {
        self.body = body
    }
}


struct LoginRequestBody : IApiRequestBody {
    let username : String
    let password : String
    
    init(username: String, password: String) {
        self.username = username
        self.password = password
    }
}
