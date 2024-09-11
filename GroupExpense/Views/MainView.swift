//
//  MainView.swift
//  GroupExpense
//
//  Created by Janek Höricht on 08.09.24.
//

import SwiftUI

struct MainView: View {
    @Environment(AuthenticationHelper.self) private var authHelper;
    
    var body: some View {
        if(!authHelper.isAuthenticated) {
            LoginView()
        }else{
            Button(action: {
                authHelper.logout()
            }, label: {
                Text("Logout!")
            })
        }
    }
}

#Preview {
    MainView()
        .environment(AuthenticationHelper.instance)
        .environment(LoginViewModel())
        .environment(RegisterViewModel())
}
