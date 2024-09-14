//
//  IAuthResponse.swift
//  GroupExpense
//
//  Created by Janek Höricht on 08.09.24.
//

import Foundation

struct RefreshResponse : IAuthResponse {
    let token : String
    let longTermToken : String
}
