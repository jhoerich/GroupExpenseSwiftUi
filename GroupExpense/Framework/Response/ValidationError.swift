//
//  IError.swift
//  GroupExpense
//
//  Created by Janek Höricht on 09.09.24.
//

import Foundation

struct ValidationError : Decodable {
    let key : String
    let message : String
}
