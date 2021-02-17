//
//  OrderViewModel.swift
//  BestFood
//
//  Created by Łukasz Andrzejewski on 16/02/2021.
//

import Foundation
import Combine

final class OrderViewModel: ObservableObject {
    
    let foodService: FoodService
    
    private var subscriptions = Set<AnyCancellable>()
    
    init(foodService: FoodService) {
        self.foodService = foodService
    }
    
    func getTotalValue(order: OrderModel) -> String {
        "\(order.entries.reduce(0) { $0 + $1.price }) zł"
    }
    
    func formatPrice(_ price: Double) -> String {
        "\(price) zł"
    }
    
    func place(_ order: OrderModel) {
        foodService.place(order: order)
            .sink(receiveCompletion: { print($0) }, receiveValue: {})
            .store(in: &subscriptions)
    }
    
}
