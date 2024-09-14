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
                ZStack {
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
                                    CustomTextField(titleText:String(localized: "usernameFieldText"), text: $vm.username)
                                    CustomSecureField(titleText: String(localized: "passwordFieldText"), text: $vm.password)
                                    
                                    
                                    if vm.error.isEmpty {
                                        Text("") // Platzhalter Text
                                            .frame(height: 40)  // Fixe Höhe für Fehlerbereich auch wenn keine Fehler vorliegen
                                    } else {
                                        ZStack {
                                            VStack(alignment: .leading, spacing: 2) {
                                                ForEach(vm.error, id: \.self) { error in
                                                    Text(error.getMessage())
                                                        .font(.system(size: 13))
                                                        .foregroundColor(.red)
                                                        .multilineTextAlignment(.leading)
                                                        .shadow(radius: 3)
                                                   
                                                }
                                            }
                                        }
                                        
                                    }
                                    
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
                                            RegisterView(usernameFromLogin: vm.username)
                                        }
                                    }
                                    Spacer()
                                    
                                }.frame(width: width*0.75)
                            }
                           
                        }
                    }
                    if viewModel.isLoading {
                        LoadingView(titleText: "")
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
        .environment(RegisterViewModel())
}
