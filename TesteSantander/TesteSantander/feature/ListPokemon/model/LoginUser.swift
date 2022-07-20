//
//  LoginUser.swift
// TesteSantander
//
//  Created by Wildson Silva on 13/07/22.
//  Copyright © 2022 Wildson Silva. All rights reserved.
//

import Foundation

struct LoginUser: Serializable {
    
    let login: String
    let password: String
    
    public func dictionaryRepresentation() -> [String: Any] {
      var dictionary: [String: Any] = [:]
        dictionary["login"] = login
        dictionary["senha"] = password        
      return dictionary
    }
    
}
