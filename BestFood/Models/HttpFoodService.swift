//
//  HttpFoodService.swift
//  BestFood
//
//  Created by Łukasz Andrzejewski on 16/02/2021.
//

import Foundation
import Combine

struct HttpFoodService: FoodService {
 
    func getFood() -> AnyPublisher<[FoodModel], RequestError> {
        URLSession.shared.request(for: "http://0.0.0.0:3000/food")
    }
    
}
