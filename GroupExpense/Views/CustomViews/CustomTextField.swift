//
//  CustomTextField.swift
//  GroupExpense
//
//  Created by Janek Höricht on 08.09.24.
//

import SwiftUI

struct CustomTextField: View {
    var titleText : String
    @Binding var text : String
    
    var body: some View {
        HStack {
            ZStack(alignment:.leading) {
                if text.isEmpty {
                    Text(self.titleText)
                        .foregroundColor(.gray)
                        .padding(.leading, 15)// Padding to match TextField padding
                }
                TextField("", text: $text)
                    .padding()
                    .textInputAutocapitalization(.none)
                    .keyboardType(.emailAddress)
                    .autocorrectionDisabled()
                    .foregroundStyle(.black)
                    .frame(height: 50)
            }
            if !self.text.isEmpty {
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
        .background(Color.white)
        .clipShape(.capsule)
        .shadow(radius:10)
    }
}

#Preview {
    CustomTextField(titleText: "E-Mail", text: .constant(""))
}
