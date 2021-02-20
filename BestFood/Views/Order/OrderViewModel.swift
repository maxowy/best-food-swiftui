//
//  OrderViewModel.swift
//  BestFood
//
//  Created by Łukasz Andrzejewski on 16/02/2021.
//

import Foundation

final class OrderViewModel: ObservableObject {
    
    func getTotalValue(order: OrderService) -> String {
        "\(order.entries.reduce(0) { $0 + $1.price }) zł"
    }
    
    func formatPrice(_ price: Double) -> String {
        "\(price) zł"
    }
    
}
