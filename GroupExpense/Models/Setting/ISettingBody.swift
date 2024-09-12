//
//  ISettingBody.swift
//  GroupExpense
//
//  Created by Janek Höricht on 11.09.24.
//

import Foundation
import SwiftUI

protocol ISettingBody : Hashable{
    var view : AnyView? { get }
    var title : String { get }
}
