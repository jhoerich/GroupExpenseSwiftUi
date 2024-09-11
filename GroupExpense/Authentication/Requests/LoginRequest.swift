//
//  LoginRequest.swift
//  GroupExpense
//
//  Created by Janek Höricht on 11.09.24.
//

import Foundation

struct LoginRequest : IAuthRequest {
    let apiKey: String = "/login"
    let httpMethod: String = "POST"
    
    var body: LoginRequestBody
    
    init(body: LoginRequestBody) {
        self.body = body
    }
}

