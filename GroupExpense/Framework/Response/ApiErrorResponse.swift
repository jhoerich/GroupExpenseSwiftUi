//
//  IWebApiErrorResponse.swift
//  GroupExpense
//
//  Created by Janek Höricht on 09.09.24.
//

import Foundation

struct ApiErrorResponse : IApiResponse, Error {
    let errors : [HashableError]
}
