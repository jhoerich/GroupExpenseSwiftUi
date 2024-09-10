//
//  MainViewModel.swift
//  GroupExpense
//
//  Created by Janek Höricht on 08.09.24.
//

import Foundation

@Observable
public class MainViewModel {
    init() {
    }
    
    public var isSignedIn : Bool {
        return AuthenticationHelper.instance.isAuthenticated
    }
    
    public func logout() {
        AuthenticationHelper.instance.logout()
    }
}
