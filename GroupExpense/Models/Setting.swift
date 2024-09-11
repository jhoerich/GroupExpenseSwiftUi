//
//  Setting.swift
//  GroupExpense
//
//  Created by Janek Höricht on 11.09.24.
//

import Foundation
import SwiftUI

struct Setting : Hashable, Identifiable {
    var id: UUID = UUID()
    
    static func == (lhs: Setting, rhs: Setting) -> Bool {
        return lhs.title == rhs.title &&
        lhs.imageSystemName == rhs.imageSystemName
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(title)
    }
    
    
    let title : String
    
    let imageSystemName : String
    let color : Color
    
    let view : AnyView?
    var destinationView : AnyView?
    
    init(title: String) {
        self.title = title
        self.color = .black
        self.imageSystemName = ""
        self.view = nil
        self.destinationView = nil
    }
    
    init(@ViewBuilder view: () -> any View) {
        self.title = ""
        self.color = .black
        self.imageSystemName = ""
        self.view = AnyView(view())
        self.destinationView = nil
    }
    
    init(title: String, color: Color) {
        self.title = title
        self.color = color
        self.imageSystemName = ""
        self.view = nil
        self.destinationView = nil
    }
    
    init(title: String, color: Color, image : String) {
        self.title = title
        self.color = color
        self.imageSystemName = image
        self.view = nil
        self.destinationView = nil
    }
    
    init(title: String, image: String) {
        self.title = title
        self.color = .black
        self.imageSystemName = image
        self.view = nil
        self.destinationView = nil
    }
    
    init(title: String, image: String, @ViewBuilder destinationView: () -> any View) {
        self.title = title
        self.color = .black
        self.imageSystemName = image
        self.view = nil
        self.destinationView = AnyView(destinationView())
    }
    
    func getImage() -> Image {
        return Image(systemName: self.imageSystemName)
    }
}
