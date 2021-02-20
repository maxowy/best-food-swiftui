//
//  FoodModel.swift
//  BestFood
//
//  Created by Łukasz Andrzejewski on 16/02/2021.
//

struct FoodModel: Decodable {

    let id: Int
    let name: String
    let description: String
    let price: Double
    let imageUrl: String
    
}
