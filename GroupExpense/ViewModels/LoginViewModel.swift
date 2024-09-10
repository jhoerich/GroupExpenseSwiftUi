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
    var email : String = ""
    var password : String = ""
    
    var error : [Error] = []
    
    init() {
        self.email = ""
        self.password = ""
    }
    
    func login() async {
        let loginRequest = LoginRequest(username: self.email, password: self.password);
        
        do {
            let authResponse: AuthResponse? = try await RequestHelper.instance.sendRequest(request: loginRequest, httpMethod: "POST")
            AuthenticationHelper.instance.login(response: authResponse!)
        }catch{
            guard let responseError = error as? WebApiErrorResponse else {
                print("\(error)")
                return
            }
            self.error = []
            print(error)
            self.error.append(responseError)
        }
    }
}
