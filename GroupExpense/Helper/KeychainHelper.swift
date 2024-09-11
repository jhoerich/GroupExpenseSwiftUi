//
//  KeychainHelper.swift
//  GroupExpense
//
//  Created by Janek Höricht on 08.09.24.
//

import Foundation
import Security

public class KeychainHelper {
    let TOKEN : String = "JwtToken";
    let TOKENLONGTERM : String = "JwtLongTermToken";

    public static let instance = KeychainHelper();
    
    func saveToken(response: AuthResponse) {
        guard let tokenData = response.token.data(using: .utf8),
              let longTermTokenData = response.longTermToken.data(using: .utf8) else {
            print("Fehler bei der Konvertierung von Token in Data")
            return
        }

        let queries: [[String: Any]] = [
            [
                kSecClass as String: kSecClassGenericPassword,
                kSecAttrAccount as String: TOKEN,
                kSecValueData as String: tokenData
            ],
            [
                kSecClass as String: kSecClassGenericPassword,
                kSecAttrAccount as String: TOKENLONGTERM,
                kSecValueData as String: longTermTokenData
            ],
        ]
        
        for query in queries {
            let castedQuery = query as CFDictionary
            SecItemDelete(castedQuery)
            SecItemAdd(castedQuery, nil)
        }
    }
    
    func loadToken() -> String? {
        return self.loadTokens(key: TOKEN)
    }
    
    func loadLongTermToken() -> String? {
        return self.loadTokens(key: TOKENLONGTERM)
    }
    
    func logout() {
        deleteToken(key: TOKEN)
        deleteToken(key: TOKENLONGTERM)
    }
    
    func isAuthenticated() -> Bool {
        guard loadToken() != nil else {
            return false
        }
        return true
    }
    
    private func loadTokens(key: String) -> String? {
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: key,
            kSecReturnData as String: true,
            kSecMatchLimit as String: kSecMatchLimitOne
        ]
    
        var dataTypeRef: AnyObject? = nil
        let status: OSStatus = SecItemCopyMatching(query as CFDictionary, &dataTypeRef)
        
        if status == errSecSuccess {
            if let retrievedData = dataTypeRef as? Data {
                return String(data: retrievedData, encoding: .utf8)
            }
        }
        return nil
    }
 
    
    private func deleteToken(key : String) {
        let query: [String: Any] = 
            [
                kSecClass as String: kSecClassGenericPassword,
                kSecAttrAccount as String: key
            ]
    }
}
