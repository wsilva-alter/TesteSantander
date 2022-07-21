//
//  RequisicaoModelProvider.swift
// TesteSantander
//
//  Created by Anderson Silva on 13/11/20.
//  Copyright © 2022 Wildson Silva. All rights reserved.
//

import Foundation
import Alamofire

class ListPokemonProvider: NSObject {
    
    private let url = AppSession.shared.urlEnvironment
    private lazy var networkRequest: NetworkRequest = {
        return NetworkRequest.shared
    }()
    
    func getListPokemon(limit: Int, offset: Int, completion: @escaping(Result<Data>) -> Void) {
        
        let params = ["param": ""] as [String: Any]
        
        networkRequest.request(url: self.url + "pokemon?limit=\(limit)",
                               params: params) { (result) in
                                completion(result)
        }
        
    }
    
    
    
}
