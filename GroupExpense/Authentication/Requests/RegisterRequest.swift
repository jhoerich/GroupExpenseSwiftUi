//
//  RegisterRequest.swift
//  GroupExpense
//
//  Created by Janek Höricht on 11.09.24.
//

import Foundation

struct RegisterRequest : IAuthRequest {
    let apiKey: String = "/register"
    let httpMethod: String = "POST"
    
    var body: RegisterRequestBody
    
    init(body: RegisterRequestBody) {
        self.body = body
    }
}
