//
//  AppSession.swift
//  TesteSantander
//
//  Created by Wildson Silva on 13/07/22.
//  Copyright © 2022 Wildson Silva. All rights reserved.
//

import Foundation

class AppSession {
    
    static let shared: AppSession = {
        let instance = AppSession()
        return instance
    }()
    
    private var delegate: OfflineDatabaseProtocol = OfflineDatabase()
    
    var urlEnvironment: String {
        get {
            return ConfigurationEnviroment.shared.environmentConfig.gatewayUrl
        }
    }
    
}
