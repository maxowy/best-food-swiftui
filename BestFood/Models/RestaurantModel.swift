//
//  RestaurantModel.swift
//  BestFood
//
//  Created by Łukasz Andrzejewski on 25/02/2021.
//

import Foundation

struct RestaurantModel: Codable, Identifiable {
    
    let id: Int
    let name: String
    let imageUrl: String
    let comments: [String]
    
}
