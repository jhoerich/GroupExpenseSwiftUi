//
//  LoginView.swift
//  GroupExpense
//
//  Created by Janek Höricht on 08.09.24.
//

import SwiftUI

struct LoginView: View {
    @Environment(\.colorScheme) var colorSchema
    @Environment(LoginViewModel.self) private var viewModel
    
    var body: some View {
        @Bindable var vm = viewModel
        
        NavigationStack {
            HStack {
                VStack {
                    GeometryReader {
                        geometry in
                        let width = geometry.size.width;
                        
                        ZStack {
                            BackgroundView()
                            VStack(spacing: 20) {
                                Spacer()
                                Text(String(localized: "login"))
                                    .font(.title)
                                    .bold()
                                    .foregroundStyle(.white)
                                CustomTextField(titleText:String(localized: "emailFieldText"), text: $vm.email)
                                CustomSecureField(titleText: String(localized: "passwordFieldText"), text: $vm.password)
                                
                                Button(
                                    action: {
                                        Task {
                                            await viewModel.login()
                                        }
                                    }) {
                                        Text(String(localized: "login").lowercased())
                                        .foregroundStyle(.white)
                                        .padding()
                                        .frame(maxWidth: .infinity)
                                        .background(Color.green)
                                        .clipShape(.capsule)
                                        .shadow(radius: 10)
                                        .bold()
                                }.padding(.top, 50)
                                
                                Button(
                                    action: {
                                    },
                                    label: {
                                        Text(String(localized: "passwordForgot"))
                                            .foregroundStyle(.white)
                                    })
                                Spacer()
                                HStack(spacing: 10) {
                                    Text(String(localized: "newAccount"))
                                        .foregroundStyle(colorSchema == .dark ? Color.white : Color.gray)
                                    
                                    NavigationLink(String(localized: "register")) {
                                        RegisterView(email: vm.email)
                                    }
                                }
                                Spacer()
                                
                            }.frame(width: width*0.75)
                        }
                       
                    }
                }
            }
            .ignoresSafeArea(.all)
        }
    }
}


#Preview {
    LoginView()
        .environment(LoginViewModel())
}
