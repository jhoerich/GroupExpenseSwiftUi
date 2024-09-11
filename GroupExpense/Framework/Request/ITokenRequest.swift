//
//  ITokenRequest.swift
//  GroupExpense
//
//  Created by Janek Höricht on 11.09.24.
//

import Foundation

protocol ITokenRequest : IApiRequest {
    var token : String { get }
}
