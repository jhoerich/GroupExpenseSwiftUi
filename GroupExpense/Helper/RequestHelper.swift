//
//  RequestHelper.swift
//  GroupExpense
//
//  Created by Janek Höricht on 10.09.24.
//

import Foundation
import SwiftUI

class RequestHelper {
    private let url : String = "http://192.168.178.140:3000/api"
    private let encoder : JSONEncoder
    private let decoder : JSONDecoder
    
    public static let instance = RequestHelper()
    
    init() {
        self.encoder = JSONEncoder()
        self.decoder = JSONDecoder()
    }
    
    func sendRequest<T : IApiResponse>(request : any IApiRequest) async throws -> T? {
        var urlRequest = URLRequest(url: URL(string: "\(url)\(request.apiKey)")!)
        urlRequest.httpMethod = request.httpMethod
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.setValue(request.apiKey, forHTTPHeaderField: "api-key")
        if let tokenRequest = request as? (any ITokenRequest) {
            urlRequest.setValue(tokenRequest.token, forHTTPHeaderField: "token")
        }
        
        let jsonData = try! self.encoder.encode(request.body)
        urlRequest.httpBody = jsonData
        
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        guard let response = response as? HTTPURLResponse else {
            throw URLError(.badServerResponse)
        }
        
        if(response.statusCode != 200) {
            let errorResponse = try! self.decoder.decode(ApiErrorResponse.self, from: data)
            print(errorResponse)
            throw errorResponse
        }
        
        let decodedDataResponse = try! self.decoder.decode(T.self, from: data)
        return decodedDataResponse
    }
}
