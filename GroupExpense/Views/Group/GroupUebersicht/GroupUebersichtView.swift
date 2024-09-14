//
//  GroupsView.swift
//  GroupExpense
//
//  Created by Janek Höricht on 14.09.24.
//

import SwiftUI

struct GroupsView: View {
    @Environment(GroupsViewModel.self) private var viewModel;
    
    var body: some View {
        NavigationStack {
            ZStack {
                List {
                    ForEach(viewModel.zeilen, id:\.id) {
                        zeile in
                        Text(zeile.bezeichnung)
                    }
                    .listRowBackground(Color(.systemGray6))
                }
                
                if viewModel.isLoading {
                    LoadingView(titleText: "")
                }
            }
        }.onAppear {
            Task {
                await viewModel.load()
            }
        }
        .scrollContentBackground(.hidden)
    }
}

#Preview {
    GroupsView()
        .environment(GroupsViewModel(zeilen: [GroupUebersichtZeile(id: UUID(), bezeichnung: "Lissabon")]))
}
