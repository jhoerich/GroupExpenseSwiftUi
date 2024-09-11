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
            RoutingView()
        }
    }
}

#Preview {
    MainView()
        .environment(AuthenticationHelper.instance)
        .environment(LoginViewModel())
        .environment(RegisterViewModel())
}
