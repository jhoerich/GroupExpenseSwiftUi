//
//  SectionSetting.swift
//  GroupExpense
//
//  Created by Janek Höricht on 11.09.24.
//

import Foundation

struct SectionSetting : Hashable, Identifiable {
    static func == (lhs: SectionSetting, rhs: SectionSetting) -> Bool {
        return lhs.title == rhs.title
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(title)
    }
    
    let id : UUID = UUID()
    let title : String
    var settings : [Setting] = []
    
    init(title: String) {
        self.title = title
    }
}
