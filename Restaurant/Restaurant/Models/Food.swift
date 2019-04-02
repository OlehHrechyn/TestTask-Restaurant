//
//  Food.swift
//  Restaurant
//
//  Created by Oleh Hrechyn on 4/2/19.
//  Copyright © 2019 Natife. All rights reserved.
//

import Foundation

typealias Food = [Dish]

struct Dish: Codable {
    let restaurant, foodName: String
    let price: Float
    let imageURL: URL
    
    enum CodingKeys: String, CodingKey {
        case restaurant
        case foodName = "food_name"
        case price
        case imageURL = "image_url"
    }
}
