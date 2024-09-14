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
    
    var body: GroupUebersichtRequestBody
    var token : String
    
    init(token : String) {
        self.token = token
        self.body = GroupUebersichtRequestBody()
    }
}

struct GroupErstellenBodyRequest : IApiRequestBody {
    let bezeichnung : String
}
