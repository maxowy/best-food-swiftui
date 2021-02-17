//
//  HttpFoodService.swift
//  BestFood
//
//  Created by Łukasz Andrzejewski on 16/02/2021.
//

import Foundation
import Combine

struct HttpFoodService: FoodService {
    
    private let url = "https://raw.githubusercontent.com/landrzejewski/best-food-swiftui/main/extras/data.json"
   
    func getFood() -> AnyPublisher<[FoodModel], HttpClientError> {
        URLSession.shared.request(forUrl: url)
    }
    
}
