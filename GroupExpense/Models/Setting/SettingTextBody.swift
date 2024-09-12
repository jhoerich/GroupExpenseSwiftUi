//
//  SettingText.swift
//  GroupExpense
//
//  Created by Janek Höricht on 11.09.24.
//

import Foundation
import SwiftUI

struct SettingTextBody : ISettingBody {
    static func == (lhs: SettingTextBody, rhs: SettingTextBody) -> Bool {
        return lhs.title == rhs.title
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(title)
    }
    
    var view: AnyView?
    var title : String
    
    init(title: String, imageSystemName: String, color: Color) {
        self.title = title
        self.view = AnyView(
            HStack {
                Image(systemName: imageSystemName)
                    .foregroundStyle(Color(.systemGray))
                Text(title)
                    .foregroundColor(color)
            }
        )
    }
    
    init(title: String, imageSystemName: String) {
        self.title = title
        self.view = AnyView(HStack {
            Image(systemName: imageSystemName)
                .foregroundStyle(Color(.systemGray))
            Text(title)
        })
    }
    
    init(title: String) {
        self.title = title
        self.view = AnyView(HStack {
            Text(title)
        })
    }
    
    init(title: String, color: Color) {
        self.title = title
        self.view = AnyView(HStack {
            Text(title)
                .foregroundColor(color)
        })
    }
}
