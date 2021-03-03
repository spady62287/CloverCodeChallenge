//
//  BaseRequest.swift
//  CloverCodeChallenge
//
//  Created by Daniel Spady on 2021-03-02.
//

import Foundation

class BaseRequest {
    
    var url: URL? {
        // NOTE: Implement this in subclasses
        return nil
    }

    var request: URLRequest? {
        if let url = url {
            var request = URLRequest(url: url)
            request.httpMethod = "GET"
            
            return request
        }
        
        return nil
    }
    
    var getRequest: URLRequest? {
        return request
    }
    
    // implment POST,PUT if requireds
}
