//
//  RequestHelper.swift
//  GroupExpense
//
//  Created by Janek Höricht on 10.09.24.
//

import Foundation
import SwiftUI

class RequestHelper {
    private let url : URL = URL(string: "http://192.168.178.140:3000/api")!
    private let encoder : JSONEncoder
    private let decoder : JSONDecoder
    
    public static let instance = RequestHelper()
    
    init() {
        self.encoder = JSONEncoder()
        self.decoder = JSONDecoder()
    }
    
    func sendRequest<T : IResponse>(request : IWebApiRequest, httpMethod: String) async throws -> T? {
        var urlRequest = URLRequest(url: self.url)
        urlRequest.httpMethod = httpMethod
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.setValue("\(request.route)", forHTTPHeaderField: "api-key")
        
        let jsonData = try! self.encoder.encode(request)
        urlRequest.httpBody = jsonData
        
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        guard let response = response as? HTTPURLResponse else {
            throw URLError(.badServerResponse)
        }
        
        if(response.statusCode != 200) {
            let errorResponse = try! self.decoder.decode(WebApiErrorResponse.self, from: data)
            throw errorResponse
        }
        
        let decodedDataResponse = try! self.decoder.decode(T.self, from: data)
        return decodedDataResponse
    }
}
