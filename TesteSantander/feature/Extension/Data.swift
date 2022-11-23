//
//  Data.swift
// TesteSantander
//
//  Created by Wildson Silva on 13/07/22.
//  Copyright © 2022 Wildson Silva. All rights reserved.
//

import Foundation

extension Data {
    
    private func newJSONDecoder() -> JSONDecoder {
        let decoder = JSONDecoder()
        if #available(iOS 13.0, *) {
            decoder.dateDecodingStrategy = .iso8601
        }
        return decoder
    }

    private func newJSONEncoder() -> JSONEncoder {
        let encoder = JSONEncoder()
        if #available(iOS 13.0, *) {
            encoder.dateEncodingStrategy = .iso8601
        }
        return encoder
    }
    
    func decodableData<T: Decodable>() -> T? {
        
        do {
            _ = try? self.newJSONDecoder().decode(T.self, from: self)
            return try? self.newJSONDecoder().decode(T.self, from: self)
        }
        catch {
            return nil
        }
        
        return try? self.newJSONDecoder().decode(T.self, from: self)
    }
    
    func decodableDataArray<T: Decodable>() -> [T]? {
        return try? self.newJSONDecoder().decode([T].self, from: self)
    }
    
    func dataToJsonArray() -> Any? {
        let json = try? JSONSerialization.jsonObject(with: self, options: .allowFragments)
        return json
    }
    
}
