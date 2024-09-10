//
//  CustomSecureField.swift
//  GroupExpense
//
//  Created by Janek Höricht on 08.09.24.
//

import SwiftUI

struct CustomSecureField: View {
    var titleText : String
    
    @State var passwordSeeable : Bool = false;
    @Binding var text : String
    
    var body: some View {
        HStack {
            ZStack(alignment:.leading) {
                if text.isEmpty {
                    Text(self.titleText)
                        .foregroundColor(.gray)
                        .padding(.leading, 15)// Padding to match TextField padding
                }
                ZStack {
                    if self.passwordSeeable {
                        TextField("", text: $text)
                            .padding()
                            .textInputAutocapitalization(.none)
                            .autocorrectionDisabled()
                            .foregroundStyle(.black)
                    }else {
                        SecureField("", text: $text)
                            .padding()
                            .textInputAutocapitalization(.none)
                            .autocorrectionDisabled()
                            .foregroundStyle(.black)
                    }
                }
                .frame(height: 50)
            }
            if !self.text.isEmpty {
                HStack {
                    Button {
                        self.passwordSeeable.toggle()
                    } label: {
                        Image(systemName: self.passwordSeeable ? "eye.slash.fill" : "eye.fill")
                            .foregroundColor(.gray)
                    }
                    .padding(.trailing, 5)
                    Button {
                        withAnimation(.easeOut(duration: 0.2), {
                            self.text = ""
                        })
                    } label: {
                        Image(systemName: "multiply.circle.fill")
                            .foregroundColor(.gray)
                    }
                    .padding(.trailing, 10)
                }
                
                
              
            }
        }
        .background(Color.white)
        .clipShape(.capsule)
        .shadow(radius:10)
    }
}

#Preview {
    CustomSecureField(titleText: "password", text: .constant(""))
}
