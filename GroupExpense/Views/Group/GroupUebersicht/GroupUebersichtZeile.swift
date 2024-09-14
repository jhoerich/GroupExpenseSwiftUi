//
//  GroupsDto.swift
//  GroupExpense
//
//  Created by Janek Höricht on 14.09.24.
//

import Foundation

struct GroupUebersichtZeile : Identifiable, Hashable {
    let id : UUID
    let bezeichnung : String
    
    init(id: UUID, bezeichnung: String) {
        self.id = id
        self.bezeichnung = bezeichnung
    }
}
