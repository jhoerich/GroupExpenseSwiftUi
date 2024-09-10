//
//  AuthenticationManager.swift
//  GroupExpense
//
//  Created by Janek Höricht on 10.09.24.
//

import Foundation

@Observable
class AuthenticationHelper {
    private (set) var isAuthenticated : Bool
    private var keychainHelper : KeychainHelper
    
    public static let instance = AuthenticationHelper()
    
    init() {
        self.isAuthenticated = !KeychainHelper.instance.isAuthenticated()
        self.keychainHelper = KeychainHelper.instance
    }
    
    func login(response: AuthResponse) {
        self.isAuthenticated = true
        keychainHelper.saveToken(response: response)
    }
    
    func logout() {
        self.isAuthenticated = false
        keychainHelper.logout()
    }
}
