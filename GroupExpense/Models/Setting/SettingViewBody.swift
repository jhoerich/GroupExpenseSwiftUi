//
//  SettingViewBody.swift
//  GroupExpense
//
//  Created by Janek Höricht on 11.09.24.
//

import Foundation
import SwiftUI

struct SettingViewBody : ISettingBody {
    static func == (lhs: SettingViewBody, rhs: SettingViewBody) -> Bool {
        return lhs.title == rhs.title
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(title)
    }
    
    var view: AnyView?
    let title: String
    
    init(title: String, @ViewBuilder view: () -> any View) {
        self.view = AnyView(view())
        self.title = title
    }
}
