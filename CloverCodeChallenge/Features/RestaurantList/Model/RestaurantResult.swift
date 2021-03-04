//
//  RestaurantResult.swift
//  CloverCodeChallenge
//
//  Created by Daniel Spady on 2021-03-02.
//

import Foundation

struct RestaurantResult: BaseCodable {    
    var category: String?
    var description: String?
    var name: String?
    var identifier: Int?
}

extension RestaurantResult {
    enum CodingKeys: String, CodingKey {
        case category
        case description
        case name
        case identifier = "id"
    }
}
