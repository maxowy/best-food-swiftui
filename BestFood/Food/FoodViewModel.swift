//
//  FoodViewModel.swift
//  BestFood
//
//  Created by Łukasz Andrzejewski on 16/02/2021.
//

import Foundation

struct FoodViewModel: Identifiable {

    let id: Int
    let name: String
    let description: String
    let price: Double
    let imageUrl: String
    
    var priceText: String {
        return "\(price) zł"
    }
    
}
