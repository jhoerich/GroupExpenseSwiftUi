//
//  AuthLoginWebApiRequest.swift
//  GroupExpense
//
//  Created by Janek Höricht on 09.09.24.
//

import Foundation

public struct AuthLoginWebApiRequest{
    let benutzername : String
    let password : String
    
    init(benutzername: String, password: String) {
        self.benutzername = benutzername
        self.password = password
    }
}
