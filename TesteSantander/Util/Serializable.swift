//
//  Serializable.swift
//  TesteSantander
//
//  Created by Wildson Silva on 11/07/20.
//  Copyright © 2022 Wildson Silva. All rights reserved.
//

import Foundation

protocol Serializable: Codable {
    func serialize() -> Data?
    func serializeToString() -> String?
    func encode() -> [String: Any]?
}

extension Serializable {
    
    private func newJSONEncoder() -> JSONEncoder {
        let encoder = JSONEncoder()
        encoder.dateEncodingStrategy = .iso8601
        return encoder
    }
    
    func serialize() -> Data? {
        return try? newJSONEncoder().encode(self)
    }
    
    func serializeToString() -> String? {
        if let jsonData = serialize() {
            return String(data: jsonData, encoding: .utf8)
        }
        return nil
    }
    
    func encode() -> [String: Any]? {
        guard let jsonData = serialize() else { return nil }
        return try? JSONSerialization.jsonObject(with: jsonData, options: []) as? [String: Any]
        
    }
}
