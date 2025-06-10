//
//  APIEndpoint.swift
//  Verimi
//
//  Created by Kishore Vaddadi on 30.07.24.
//

import Foundation

protocol APIEndpoint {
    var baseURL: URL { get }
    var path: String { get }
    var method: HttpMethod { get }
    var headers: [String: String]? { get }
    var parameters: [String: Any]? { get }
}

extension APIEndpoint {
    var headers: [String: String]? {
        return nil
    }
    
    var parameters: [String: Any]? {
        return nil
    }
}
