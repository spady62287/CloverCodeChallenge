//
//  RestaurantResponse.swift
//  CloverCodeChallenge
//
//  Created by Daniel Spady on 2021-03-02.
//

import Foundation

public struct RestaurantResponse: BaseResponse {
    
    var request: RestaurantRequest?
    var task: URLSessionDataTask?
    var data: Data?
    var response: HTTPURLResponse?
    var error: Error?
    var result: [RestaurantResult]?
    
    public init() {
        self.request = Request()
        self.task = nil
        self.data = nil
        self.response = nil
        self.error = nil
        result = nil
    }
}
