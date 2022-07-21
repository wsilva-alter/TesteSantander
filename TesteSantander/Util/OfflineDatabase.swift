//
//  OfflineDatabase.swift
// TesteSantander
//
//  Created by Wildson Silva on 13/07/22.
//  Copyright © 2022 Wildson Silva. All rights reserved.
//

import Foundation
import SwiftKeychainWrapper

protocol OfflineDatabaseProtocol {
  func save<T: Serializable>(object: T, forKey key: OfflineDatabase.Keys)
  func getObject<T: Codable>(key: OfflineDatabase.Keys) -> T?

  @discardableResult
  func remove(key: OfflineDatabase.Keys) -> Bool
  func clear()
}

final class OfflineDatabase {
    //MARK: - Keys -
    enum Keys: String {
        case userKey
    }
    
    // MARK: - Properties -
    private let keychainWrapper: KeychainWrapper    

    // MARK: - Init -
    init(keychainWrapper: KeychainWrapper = KeychainWrapper.standard) {
      self.keychainWrapper = keychainWrapper
    }
}

// MARK: - DatabaseProtocol -
extension OfflineDatabase: OfflineDatabaseProtocol {
    func save<T: Serializable>(object: T, forKey key: OfflineDatabase.Keys) {
        guard let encoded = object.serialize() else { return }
        self.keychainWrapper.set(encoded, forKey: key.rawValue,
                                withAccessibility: .whenUnlockedThisDeviceOnly)
    }
    
    func getObject<T: Codable>(key: OfflineDatabase.Keys) -> T? {
        
        guard let data = self.keychainWrapper.data(forKey: key.rawValue,
                                                 withAccessibility: .whenUnlockedThisDeviceOnly) else { return nil }
        
        switch key {
        case .userKey:
            guard let object: T = data.decodableData() else { return nil }
            return object
        }
    }
    
    @discardableResult
    func remove(key: OfflineDatabase.Keys) -> Bool {
        let removed = self.keychainWrapper.removeObject(forKey: key.rawValue)
        return removed
    }
    
    func clear() {
        _ = self.keychainWrapper.removeAllKeys()
    }
}

