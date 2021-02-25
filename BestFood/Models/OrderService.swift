//
//  OrderService.swift
//  BestFood
//
//  Created by Łukasz Andrzejewski on 17/02/2021.
//

import Foundation
import Combine

final class OrderService: ObservableObject {
    
    @Published var order = OrderModel(entries: [])
    
    private var subscriptions = Set<AnyCancellable>()
    
    func confirm() {
        URLSession.shared.request(for: "http://0.0.0.0:3000/orders", payload: order)
            .sink(receiveCompletion: { [self] completion in
                switch completion {
                case .finished:
                    order.entries.removeAll()
                case .failure(let error):
                    print(error)
                }
            }, receiveValue: {})
            .store(in: &subscriptions)
    }
    
}
