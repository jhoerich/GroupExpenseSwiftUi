//
//  MainView.swift
//  GroupExpense
//
//  Created by Janek Höricht on 08.09.24.
//

import SwiftUI

struct MainView: View {
    @Environment(AuthenticationHelper.self) private var authHelper;
    @State private var isLoading = true
    
    var body: some View {
        Group {
            NavigationStack {
                if(isLoading) {
                    LoadingView(titleText: String(localized: "loading"))
                }else {
                    if(!authHelper.isLoggedIn) {
                        LoginView()
                    }else{
                        RoutingView()
                    }
                }
            }
        }
        .onAppear {
            Task {
                await checkAuthentication()
            }
        }
    }
    
    private func checkAuthentication() async {
        self.isLoading = true
        await authHelper.authenticate()
        self.isLoading = false
    }
}

#Preview {
    MainView()
        .environment(AuthenticationHelper.instance)
        .environment(LoginViewModel())
        .environment(RegisterViewModel())
        .environment(GroupUebersichtViewModel())
        .environment(GroupErstellenViewModel())
}
