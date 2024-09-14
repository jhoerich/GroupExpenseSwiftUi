//
//  GroupsView.swift
//  GroupExpense
//
//  Created by Janek Höricht on 14.09.24.
//

import SwiftUI

struct GroupUebersichtView : View {
    @Environment(GroupUebersichtViewModel.self) private var viewModel;
    @State private var oeffneAnlage : Bool = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                List(viewModel.zeilen, id:\.id) {
                    zeile in
                    VStack {
                        Text(zeile.bezeichnung)
                    }
                    .listRowBackground(Color(.systemGray6))
                }
                .refreshable {
                    await viewModel.load()
                }
                
                if viewModel.isLoading {
                    LoadingView(titleText: String(localized: "loading"))
                }
            }.toolbar {
                Button(action: {
                    self.oeffneAnlage.toggle()
                }, label: {
                    Image(systemName: "plus")
                        .foregroundStyle(.black)
                
                })
            }
        }
        .sheet(isPresented: self.$oeffneAnlage, onDismiss: {
            loadDatas()
        }, content: {
            GroupErstellenView()
        })
        .onAppear {
            loadDatas()
        }
        .scrollContentBackground(.hidden)
    }
    
    func loadDatas() {
        Task {
            defer {
                viewModel.isLoading.toggle()
            }
            
            viewModel.isLoading.toggle()
            await viewModel.load();
        }
    }
}

#Preview {
    GroupUebersichtView()
        .environment(GroupUebersichtViewModel(zeilen: [GroupUebersichtZeile(id: UUID(), bezeichnung: "Lissabon")]))
        .environment(GroupErstellenViewModel())
}
