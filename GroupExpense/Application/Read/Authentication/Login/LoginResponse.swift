//
//  LoginResponse.swift
//  GroupExpense
//
//  Created by Janek Höricht on 14.09.24.
//

import Foundation

struct LoginResponse  : IAuthResponse {
    let token : String
    let longTermToken : String
}
