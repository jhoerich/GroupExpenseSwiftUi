//
//  IAuthResponse.swift
//  GroupExpense
//
//  Created by Janek Höricht on 14.09.24.
//

import Foundation

protocol IAuthResponse : IApiResponse {
    var token : String { get }
    var longTermToken : String { get }
}
