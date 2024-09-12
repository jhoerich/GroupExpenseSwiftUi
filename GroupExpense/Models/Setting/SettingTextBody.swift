//
//  SettingText.swift
//  GroupExpense
//
//  Created by Janek Höricht on 11.09.24.
//

import Foundation
import SwiftUI

struct SettingTextBody : ISettingBody {
    static func == (lhs: SettingText, rhs: SettingText) -> Bool {
        return lhs.title == rhs.title
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(title)
    }
    
    var view: AnyView?
    var title : String
    
    init(title: String, imageSystemName: String, color: Color) {
        self.view = AnyView(HStack {
            Image(systemName: imageSystemName)
                .foregroundStyle(Color(.systemGray))
        })
    }
}
