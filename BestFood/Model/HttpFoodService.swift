//
//  HttpFoodService.swift
//  BestFood
//
//  Created by Łukasz Andrzejewski on 16/02/2021.
//

import Foundation
import Combine

struct HttpFoodService: FoodService {
    
    private let url = URL(string: "https://raw.githubusercontent.com/landrzejewski/best-food-swiftui/main/extras/data.json")!
   
    func getFood() -> AnyPublisher<[FoodModel], Error> {
        URLSession.shared
            .dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: [FoodModel].self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
}
