//
//  Error.swift
//  GroupExpense
//
//  Created by Janek Höricht on 11.09.24.
//

import Foundation

struct HashableError : Hashable, Decodable {
    let key : String
    let message : String
    
    init(key: String, originalMessage: String) {
        self.key = key
        self.message = originalMessage
    }
    
    func getMessage() -> String {
        let localizedMessage = String(localized: String.LocalizationValue(self.key))
        if localizedMessage.isEmpty {
            return self.message
        }
        return localizedMessage
    }
}
