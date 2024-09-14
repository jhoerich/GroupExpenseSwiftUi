//
//  RefreshRequestBody.swift
//  GroupExpense
//
//  Created by Janek Höricht on 14.09.24.
//

import Foundation

struct RefreshRequestBody : IApiRequestBody {
    let token : String
    let longTermToken : String
    
    init(token: String, longTermToken: String) {
        self.token = token
        self.longTermToken = longTermToken
    }
}
