//
//  FakeFoodService.swift
//  BestFood
//
//  Created by Łukasz Andrzejewski on 16/02/2021.
//

import Combine

struct FakeFoodService: FoodService {
    
    func getFood() -> AnyPublisher<[FoodModel], Error> {
        Just([
            FoodModel(id: 1, name: "Asparagus steak", description: "Nice and healthy steak.", price: 120.50, imageUrl: "asparagus-steak"),
            FoodModel(id: 2, name: "Healthy pizza", description: "Mega pizza.", price: 90, imageUrl: "healthy-pizza")
        ])
        .setFailureType(to: Error.self)
        .eraseToAnyPublisher()
    }
    
}
