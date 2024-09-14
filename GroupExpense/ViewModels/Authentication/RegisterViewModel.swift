//
//  RegisterViewModel.swift
//  GroupExpense
//
//  Created by Janek Höricht on 11.09.24.
//

import Foundation

@Observable
class RegisterViewModel {
    var username: String = ""
    var email: String = ""
    var password1 : String = ""
    var password2 : String = ""
    
    var error : [HashableError] = []
    var isLoading : Bool = false
    
    init() {
        self.username = ""
        self.email = ""
        self.password1 = ""
        self.password2 = ""
        self.error = []
    }
    
    func register() async {
        let request = RegisterRequest(body: RegisterRequestBody(email: self.email, username: self.username, password1: self.password1, password2: self.password2))
        self.error = []
        
        self.isLoading.toggle()
        
        defer {
            self.isLoading.toggle()
        }
        
        
        do {
            let authResponse: RegisterResponse? = try await RequestHelper.instance.sendRequest(request: request)
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
