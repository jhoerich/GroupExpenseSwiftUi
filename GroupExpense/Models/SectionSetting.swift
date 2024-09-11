//
//  SectionSetting.swift
//  GroupExpense
//
//  Created by Janek Höricht on 11.09.24.
//

import Foundation

struct SectionSetting : Hashable {
    let title : String
    var settings : [Setting]
    
    init(title: String, settings: [Setting]) {
        self.title = title
        self.settings = settings
    }
}
