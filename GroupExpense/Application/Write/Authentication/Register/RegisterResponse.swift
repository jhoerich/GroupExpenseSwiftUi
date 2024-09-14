//
//  RegisterResponse.swift
//  GroupExpense
//
//  Created by Janek Höricht on 14.09.24.
//

import Foundation

struct RegisterResponse : IAuthResponse {
    let token : String
    let longTermToken : String
}
