//
//  GroupsViewModel.swift
//  GroupExpense
//
//  Created by Janek Höricht on 14.09.24.
//

import Foundation

@Observable
class GroupUebersichtViewModel {
    var zeilen : [GroupUebersichtZeile] = []
    var isLoading : Bool = false
    
    init(zeilen: [GroupUebersichtZeile]) {
        self.zeilen = zeilen
    }
    
    init() {
        self.zeilen = []
    }
    
    
    func load() async {
        guard let token = KeychainHelper.instance.loadToken() else {
            return
        }
        let request = GroupUebersichtRequest(token: token)

        do {
            let response: GroupUebersichtResponse? = try await RequestHelper.instance.sendRequest(request: request)
            guard let dtos = response?.dtos else {
                self.zeilen = []
                return
            }
            self.zeilen = dtos.compactMap { group in
                GroupUebersichtZeile(id: group.id, bezeichnung: group.name)
            }
        } catch {
            print("Error: \(error)")
            return
        }
    }
}
