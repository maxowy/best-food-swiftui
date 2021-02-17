//
//  HttpFoodService.swift
//  BestFood
//
//  Created by Łukasz Andrzejewski on 16/02/2021.
//

import Foundation
import Combine

struct HttpFoodService: FoodService {
 
    func getFood() -> AnyPublisher<[FoodModel], HttpClientError> {
        URLSession.shared.get(from: "https://raw.githubusercontent.com/landrzejewski/best-food-swiftui/main/extras/data.json")
    }
    
    func place(order: OrderModel) -> AnyPublisher<Void, HttpClientError> {
        URLSession.shared.post(to: "http://fullstack-developer.io/orders", body: OrderRequest(entries: order.entries))
    }
    
}
