//
//  RegisterRequest.swift
//  GroupExpense
//
//  Created by Janek Höricht on 08.09.24.
//

import Foundation

public struct RegisterRequest : Encodable {
    let email : String
    let benutzername : String
    let password1 : String
    let password2 : String
    
    init(email: String, benutzername: String, password1: String, password2: String) {
        self.email = email
        self.benutzername = benutzername
        self.password1 = password1
        self.password2 = password2
    }
}
