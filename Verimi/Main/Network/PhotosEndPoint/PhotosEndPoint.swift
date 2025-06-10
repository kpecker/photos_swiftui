//
//  PhotosEndPoint.swift
//  Verimi
//
//  Created by Kishore Vaddadi on 30.07.24.
//

import Foundation

enum PhotosEndpoint: APIEndpoint {
    case photos
    
    var baseURL: URL {
        return URL(string: "https://picsum.photos/v2")!
    }
    
    var path: String {
        switch self {
        case .photos:
            return "/list"
        }
    }
    
    var method: HttpMethod {
        switch self {
        case .photos:
            return .get
        }
    }
    
    var headers: [String: String]? {
        return ["Content-Type": "application/json",
                "Accept": "application/json"]
    }
    
    var parameters: [String: Any]? {
        switch self {
        default:
            return ["page": 1, "limit": 100]
        }
    }
}
