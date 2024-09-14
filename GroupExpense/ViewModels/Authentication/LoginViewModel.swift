//
//  LoginViewModel.swift
//  GroupExpense
//
//  Created by Janek Höricht on 09.09.24.
//

import Foundation
import SwiftUI

@Observable
public class LoginViewModel {
    var username : String = ""
    var password : String = ""
    var isLoading : Bool = false
    
    var error : [HashableError] = []
    
    init() {
        self.username = ""
        self.password = ""
        self.error = []
    }
    
    func login() async {
        let loginRequest = LoginRequest(body: LoginRequestBody(username: self.username, password: self.password))
        self.error = []
        self.isLoading.toggle()
        
        defer {
            self.isLoading.toggle()
        }
        
        do {
            let authResponse: LoginResponse? = try await RequestHelper.instance.sendRequest(request: loginRequest)
            AuthenticationHelper.instance.login(response: authResponse!)
        }catch{
            guard let responseError = error as? ApiErrorResponse else {
                print("\(error)")
                return
            }
            self.error = responseError.errors
        }
    }
}
