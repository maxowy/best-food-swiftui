//
//  RestaurantService.swift
//  BestFood
//
//  Created by Łukasz Andrzejewski on 25/02/2021.
//

import Foundation
import Combine

struct RestaurantService {
    
    private let baseUrl = "http://0.0.0.0:3000/restaurants"
    
    func getRestaurants() -> AnyPublisher<[RestaurantModel], RequestError> {
        URLSession.shared.request(for: baseUrl)
    }
    
    func getRetaurant(id: Int) -> AnyPublisher<RestaurantModel, RequestError> {
        URLSession.shared.request(for: "\(baseUrl)/\(id)")
    }
    
    func updateRetaurant(restaurant: RestaurantModel) -> AnyPublisher<Void, RequestError> {
        URLSession.shared.request(for: "\(baseUrl)/\(restaurant.id)", method: .put, payload: restaurant)
    }
    
}
