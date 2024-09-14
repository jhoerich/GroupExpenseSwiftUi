//
//  GroupErstellenRequest.swift
//  GroupExpense
//
//  Created by Janek Höricht on 15.09.24.
//

import Foundation

struct GroupErstellenRequest : ITokenRequest {
    let httpMethod: String = "POST";
    let apiKey: String = "/group/create"
    
    var body: GroupErstellenBodyRequest
    var token : String
    
    init(token : String, body : GroupErstellenBodyRequest) {
        self.token = token
        self.body = body
    }
}

struct GroupErstellenBodyRequest : IApiRequestBody {
    let name : String
}
