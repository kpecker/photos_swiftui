//
//  Photo.swift
//  Verimi
//
//  Created by Kishore Vaddadi on 31.07.24.
//

import Foundation

struct Photo: Decodable, Identifiable {
    let id: String
    let author: String
    let url: String
    let downloadUrl: String
    @DecodableBool var isFavourite: Bool
}


@propertyWrapper
struct DecodableBool {
    var wrappedValue = false
}

extension DecodableBool: Decodable {
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        wrappedValue = try container.decode(Bool.self)
    }
}

extension KeyedDecodingContainer {
    func decode(_ type: DecodableBool.Type,
                forKey key: Key) throws -> DecodableBool {
        try decodeIfPresent(type, forKey: key) ?? .init()
    }
}
