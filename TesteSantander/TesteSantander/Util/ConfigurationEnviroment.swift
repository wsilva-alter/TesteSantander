//
//  ConfigurationEnviroment.swift
// TesteSantander
//
//  Created by Anderson Silva on 07/12/20.
//  Copyright © 2022 Wildson Silva. All rights reserved.
//

import Foundation

enum EnviromentConfiguration: String {
    
    case release = "Release"
    case debug = "Debug"
    case homolog = "Homolog"
    
    var gatewayUrl: String {
        switch self {
        case .homolog:
            return "https://pokeapi.co/api/v2/"
        default:
            return "https://pokeapi.co/api/v2/"
        }
    }
    
    var whoAmI: String? {
        switch self {
        case .debug:
            return "DEBUG"
        case .homolog:
            return "HOMOLOG"
        default:
            return nil
        }
    }
    
}

class ConfigurationEnviroment: NSObject {
    static let shared: ConfigurationEnviroment = {
        let instance = ConfigurationEnviroment.init()
        return instance
    }()
    
    lazy var environmentConfig: EnviromentConfiguration = {
        if let configuration = Bundle.main.object(forInfoDictionaryKey: "Configuration") as? String {
            if configuration == "Debug"{
                return EnviromentConfiguration.debug
            } else if configuration == "Homolog" {
                return EnviromentConfiguration.homolog
            } else {
                return EnviromentConfiguration.release
            }
        }
        return EnviromentConfiguration.debug
    }()
    
}
