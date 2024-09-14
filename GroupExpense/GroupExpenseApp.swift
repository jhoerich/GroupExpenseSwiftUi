//
//  GroupExpenseApp.swift
//  GroupExpense
//
//  Created by Janek Höricht on 08.09.24.
//

import SwiftUI

@main
struct GroupExpenseApp: App {
    var body: some Scene {
        WindowGroup {
            MainView()
            .environment(AuthenticationHelper.instance)
            .environment(LoginViewModel())
            .environment(RegisterViewModel())
            .environment(GroupUebersichtViewModel())
            .environment(GroupErstellenViewModel())
        }
    }
}
