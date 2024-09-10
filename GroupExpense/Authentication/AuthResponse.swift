//
//  IAuthResponse.swift
//  GroupExpense
//
//  Created by Janek Höricht on 08.09.24.
//

import Foundation

struct AuthResponse : IResponse {
    let token : String
    let longTermToken : String
}
