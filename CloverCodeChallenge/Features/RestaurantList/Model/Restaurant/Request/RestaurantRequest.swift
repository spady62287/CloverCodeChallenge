//
//  RestaurantRequest.swift
//  CloverCodeChallenge
//
//  Created by Daniel Spady on 2021-03-02.
//

import Foundation

class RestaurantRequest: BaseRequest {
    
    override var url: URL? {
        let urlString = BaseService.restaurantEndpoint
        return URL(string: urlString)
    }
}
