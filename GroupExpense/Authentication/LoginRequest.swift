//
//  LoginRequest.swift
//  GroupExpense
//
//  Created by Janek Höricht on 08.09.24.
//

import Foundation

public struct LoginRequest : IWebApiRequest {
    public var token: UUID
    public var longTermToken: UUID
    
    var username : String
    var password : String
    
    public let route : String = "/login";
    
    init(username: String, password: String) {
        self.username = username
        self.password = password
        self.token = UUID()
        self.longTermToken = UUID()
    }
}
