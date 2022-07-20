//
//  OcsProvider.swift
// TesteSantander
//
//  Created by Wildson Silva on 11/07/20.
//  Copyright © 2022 Wildson Silva. All rights reserved.
//

import Foundation
import Alamofire

class DetailPokemonProvider: NSObject {
    
    private let url = AppSession.shared.urlEnvironment
    private lazy var networkRequest: NetworkRequest = {
        return NetworkRequest.shared
    }()
    
    func getDetailPokemon(id:Int, completion: @escaping(Result<Data>) -> Void) {
        
        let params = ["parma": ""] as [String: Any]
        
        networkRequest.request(url: self.url + "pokemon/\(id)",
                               params: params) { (result) in
                                completion(result)
        }
        
    }
    

    
}
