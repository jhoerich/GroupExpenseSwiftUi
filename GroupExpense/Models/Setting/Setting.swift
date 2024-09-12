//
//  Setting.swift
//  GroupExpense
//
//  Created by Janek Höricht on 11.09.24.
//

import Foundation
import SwiftUI

struct Setting : Hashable, Identifiable{
    static func == (lhs: Setting, rhs: Setting) -> Bool {
        return lhs.id == rhs.id
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    var id: UUID = UUID()
    
    var destinationView: AnyView? = nil
    var body: any ISettingBody
    var action: (() -> Void)?
    var type : SettingDestinationType = SettingDestinationType.nothing
    
    init(body: any ISettingBody, destinationType : SettingDestinationType, @ViewBuilder view: () -> any View, action: @escaping (() -> Void)) {
        self.destinationView = AnyView(view())
        self.type = destinationType
        self.body = body
        self.action = action
    }
    
    init(body: any ISettingBody, destinationType : SettingDestinationType, @ViewBuilder view: () -> any View) {
        self.destinationView = AnyView(view())
        self.type = destinationType
        self.body = body
        self.action = nil
    }
    
    init(body: any ISettingBody) {
        self.destinationView = nil
        self.body = body
        self.action = nil
    }
    
    init(body: any ISettingBody, action: @escaping (() -> Void)) {
        self.destinationView = nil
        self.body = body
        self.action = action
    }
    
    init(body: any ISettingBody, destinationType : SettingDestinationType,action: @escaping (() -> Void)) {
        self.type = destinationType
        self.body = body
        self.action = action
    }
}

enum SettingDestinationType {
    case page, sheet, popup, settings, nothing
}
