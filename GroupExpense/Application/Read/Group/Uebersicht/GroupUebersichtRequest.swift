//
//  GroupUebersichtRequest.swift
//  GroupExpense
//
//  Created by Janek Höricht on 14.09.24.
//

import Foundation

struct GroupUebersichtRequest : ITokenRequest {
    let httpMethod: String = "POST";
    let apiKey: String = "/group/uebersicht"
    
    var body: GroupUebersichtRequestBody
    var token : String
    
    init(token : String) {
        self.token = token
        self.body = GroupUebersichtRequestBody()
    }
}

struct GroupUebersichtRequestBody : IApiRequestBody { }

