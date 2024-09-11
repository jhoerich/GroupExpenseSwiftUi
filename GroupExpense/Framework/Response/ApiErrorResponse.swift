//
//  IWebApiErrorResponse.swift
//  GroupExpense
//
//  Created by Janek Höricht on 09.09.24.
//

import Foundation

struct WebApiErrorResponse : IResponse, Error {
    let errors : [String : String]
}
