//
//  Error.swift
//  GroupExpense
//
//  Created by Janek Höricht on 11.09.24.
//

import Foundation

struct HashableError : Hashable {
    let key : String
    let originalMessage : String
    
    init(key: String, originalMessage: String) {
        self.key = key
        self.originalMessage = originalMessage
    }
    
    func getMessage() -> String {
        let message = String(localized: "\(self.key)")
        guard message.isEmpty else {
            return self.originalMessage
        }
        return message
    }
}
