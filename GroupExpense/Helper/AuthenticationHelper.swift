//
//  AuthenticationManager.swift
//  GroupExpense
//
//  Created by Janek Höricht on 10.09.24.
//

import Foundation

@Observable
class AuthenticationHelper {
    private (set) var isLoggedIn : Bool
    private var keychainHelper : KeychainHelper
    
    public static let instance = AuthenticationHelper()
    
    init() {
        self.isLoggedIn = false
        self.keychainHelper = KeychainHelper.instance
    }
    
    func login(response: IAuthResponse) {
        self.isLoggedIn = true
        keychainHelper.saveToken(response: response)
    }
    
    func logout() {
        self.isLoggedIn = false
        keychainHelper.logout()
    }
    
    func authenticate() async {
        if keychainHelper.isAuthenticated() {
            if await refresh() {
                self.isLoggedIn = true
                return
            }
        }
    }
    
    func refresh() async -> Bool {
        do {
            let refreshRequest = RefreshRequest(body: RefreshRequestBody(token: keychainHelper.loadToken()!, longTermToken: keychainHelper.loadLongTermToken()!))
            let response : RefreshResponse? = try await RequestHelper.instance.sendRequest(request: refreshRequest)
            keychainHelper.saveToken(response: response!)
            return true
        }catch {
            guard error is ApiErrorResponse else {
                print("\(error)")
                return false;
            }
            return false;
        }
    }
}
