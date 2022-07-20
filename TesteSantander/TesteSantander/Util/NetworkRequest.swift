//
//  NetworkRequest.swift
// TesteSantander
//
//  Created by Wildson Silva on 14/07/20.
//  Copyright © 2022 Wildson Silva. All rights reserved.
//

import Foundation
import Alamofire

class NetworkRequest: NSObject {
    
    static let shared: NetworkRequest = {
        let instance = NetworkRequest()
        return instance
    }()
    
    lazy var manager: SessionManager = {
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = 30
        configuration.timeoutIntervalForResource = 30
        
        return SessionManager(configuration: configuration)
    }()
    
    func request(url: String, params: Parameters, enconding: JSONEncoding = .default, header: HTTPHeaders? = nil, completion: @escaping(Result<Data>) -> Void) {
        
        self.manager.request(url,
                             method: .get,
                             parameters: nil,
                             encoding: enconding,
                             headers: header)
            .validate(statusCode: 200..<400)
            .validate(contentType: ["application/json"])
            .responseData { (response) in
                completion(response.result)
        }
        
        
        
    }
    
    
    
    func cancelAllPendingRequests() {
        
        self.manager.session.getTasksWithCompletionHandler { (sessionDataTask, uploadData, downloadData) in
            sessionDataTask.forEach {
                $0.cancel()
            }
            uploadData.forEach { $0.cancel() }
            downloadData.forEach { $0.cancel() }
        }
        
    }
    
}
