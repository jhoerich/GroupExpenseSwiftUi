//
//  GroupUebersichtResponse.swift
//  GroupExpense
//
//  Created by Janek Höricht on 14.09.24.
//

import Foundation

struct GroupUebersichtResponse : IApiResponse {
    let dtos : [GroupUebersichtDto]
    
    init() {
        dtos = []
    }
}

struct GroupUebersichtDto : Decodable {
    let id : UUID
    let name : String
}
