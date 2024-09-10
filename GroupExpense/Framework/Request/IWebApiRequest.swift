//
//  IWebApiRequest.swift
//  GroupExpense
//
//  Created by Janek Höricht on 08.09.24.
//

import Foundation

public protocol IWebApiRequest : Encodable{
    var token : UUID { get }
    var longTermToken : UUID { get }
    var route : String { get }
}
