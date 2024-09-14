//
//  GroupErstellenView.swift
//  GroupExpense
//
//  Created by Janek Höricht on 15.09.24.
//

import SwiftUI

struct GroupErstellenView: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(GroupErstellenViewModel.self) private var viewModel
    
    var body: some View {
        @Bindable var vm = viewModel
        
        NavigationStack {
            VStack(spacing:10) {
                CustomTextField(titleText: String(localized:"name"), text: $vm.bezeichnung)
                if vm.errors.isEmpty {
                    Text("") // Platzhalter Text
                        .frame(height: 40)  // Fixe Höhe für Fehlerbereich auch wenn keine Fehler vorliegen
                } else {
                    ZStack {
                        VStack(alignment: .leading, spacing: 2) {
                            ForEach(vm.errors, id: \.self) { error in
                                Text(error.getMessage())
                                    .font(.system(size: 13))
                                    .foregroundColor(.red)
                                    .multilineTextAlignment(.leading)
                                    .shadow(radius: 3)
                               
                            }
                        }
                    }
                    
                }
                Spacer()
            }
            .padding()
            .toolbar {
                    ToolbarItem(placement: .confirmationAction, content: {
                        Button(action: {
                            Task {
                                let gespeichert = await viewModel.speichern()
                                if gespeichert != nil {
                                    self.dismiss()
                                }
                            }
                        }, label: {
                            Text(String(localized: "create"))
                                .foregroundStyle(.black)
                        })
                    })
                    ToolbarItem(placement: .cancellationAction, content: {
                        Button(action: {
                            viewModel.resetValues()
                            self.dismiss()
                        }, label: {
                            Text(String(localized: "cancel"))
                                .foregroundStyle(.black)
                        })
                    })
                }
                .navigationTitle(String(localized: "newGroup"))
                .navigationBarTitleDisplayMode(.inline)
            }
    }
}

#Preview {
    GroupErstellenView()
        .environment(GroupErstellenViewModel())
}
