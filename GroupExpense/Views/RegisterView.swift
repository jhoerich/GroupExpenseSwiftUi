//
//  RegisterView.swift
//  GroupExpense
//
//  Created by Janek Höricht on 08.09.24.
//

import SwiftUI

struct RegisterView: View {
    @State private var username: String = ""
    @State var email: String
    @State private var password1: String = ""
    @State private var password2: String = ""
    
    @Environment(\.colorScheme) var colorSchema
    
    var body: some View {
        HStack {
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
                            
                            CustomTextField(titleText: String(localized: "emailFieldText"), text: $email)
                            CustomTextField(titleText: String(localized: "usernameFieldText"), text: $username)
                            CustomSecureField(titleText: String(localized: "passwordFieldText"), text: $password1)
                            CustomSecureField(titleText: String(localized: "passwordFieldTextRepeat"), text: $password2)
                            Button(action: {
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
        }
        .ignoresSafeArea(.all)
    }
}

#Preview {
    RegisterView(email: "")
}
