//
//  APIClient.swift
//  Verimi
//
//  Created by Kishore Vaddadi on 30.07.24.
//

import Foundation
import Combine

protocol APIClient {
    associatedtype EndpointType: APIEndpoint
    func request<T: Decodable>(_ endpoint: EndpointType) -> AnyPublisher<T, Error>
}

