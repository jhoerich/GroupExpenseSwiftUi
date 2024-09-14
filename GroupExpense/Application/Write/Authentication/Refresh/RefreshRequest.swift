//
//  RefreshRequest.swift
//  GroupExpense
//
//  Created by Janek Höricht on 14.09.24.
//

import Foundation

struct RefreshRequest : IApiRequest {
    let apiKey: String = "/auth/refresh"
    let httpMethod: String = "POST"
    
    var body: RefreshRequestBody
    
    init(body: RefreshRequestBody) {
        self.body = body
    }
}


struct RefreshRequestBody : IApiRequestBody {
    let token : String
    let longTermToken : String
    
    init(token: String, longTermToken: String) {
        self.token = token
        self.longTermToken = longTermToken
    }
}
