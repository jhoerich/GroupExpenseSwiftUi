//
//  RegisterView.swift
//  GroupExpense
//
//  Created by Janek Höricht on 08.09.24.
//

import SwiftUI

struct RegisterView: View {
    @Environment(\.colorScheme) var colorSchema
    @Environment(RegisterViewModel.self) private var viewModel
    
    var usernameFromLogin : String
    
    var body: some View {
        @Bindable var vm = viewModel
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
                                Text(String(localized: "register"))
                                    .font(.title)
                                    .bold()
                                    .foregroundStyle(.white)
                                
                                CustomTextField(titleText: String(localized: "emailFieldText"), text: $vm.email)
                                CustomTextField(titleText: String(localized: "usernameFieldText"), text: $vm.username)
                                CustomSecureField(titleText: String(localized: "passwordFieldText"), text: $vm.password1)
                                CustomSecureField(titleText: String(localized: "passwordFieldTextRepeat"), text: $vm.password2)
                                
                                
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
                                
                                Button(action: {
                                    Task {
                                        await viewModel.register()
                                    }
                                }) {
                                    Text(String(localized: "register").lowercased())
                                        .foregroundStyle(.white)
                                        .padding()
                                        .frame(maxWidth: .infinity)
                                        .background(Color.green)
                                        .clipShape(.capsule)
                                        .shadow(radius: 10)
                                        .bold()
                                }.padding(.top, 50)
                                Spacer()
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
        .onAppear{
            viewModel.username = self.usernameFromLogin
        }
        .ignoresSafeArea(.all)
    }
}

#Preview {
    RegisterView(usernameFromLogin: "jhoerich")
        .environment(RegisterViewModel())
}
