//
//  GroupErstellenViewModel.swift
//  GroupExpense
//
//  Created by Janek Höricht on 15.09.24.
//

import Foundation

@Observable
public class GroupErstellenViewModel {
    
    var bezeichnung : String = ""
    var errors : [HashableError] = []
    
    init() {
        
    }
    
    func resetValues() {
        self.bezeichnung = ""
        self.errors = []
    }
    
    func speichern() async -> UUID? {
        guard let token = KeychainHelper.instance.loadToken() else {
            return nil
        }
        let request = GroupErstellenRequest(token: token, body: GroupErstellenBodyRequest(name: bezeichnung))
        do {
            let response : GroupErstellenResponse? = try await RequestHelper.instance.sendRequest(request: request)
            self.resetValues()
            return response?.groupId
        }catch{
            guard let responseError = error as? ApiErrorResponse else {
                print("\(error)")
                return nil
            }
            self.errors = responseError.errors
        }
        return nil
    }
}
