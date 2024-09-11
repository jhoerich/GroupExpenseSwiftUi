//
//  IApiRequest.swift
//  GroupExpense
//
//  Created by Janek Höricht on 11.09.24.
//

import Foundation

protocol IApiRequest : Encodable {
    associatedtype BodyType : IApiRequestBody
    
    var apiKey : String { get }
    var httpMethod : String { get }
    var body : BodyType { get }
}
