//
//  GroupErstellenResponse.swift
//  GroupExpense
//
//  Created by Janek Höricht on 15.09.24.
//

import Foundation

struct GroupErstellenResponse : IApiResponse {
    let groupId : UUID
    
    init(groupId: UUID) {
        self.groupId = groupId
    }
}
