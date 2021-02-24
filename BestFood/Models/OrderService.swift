//
//  OrderService.swift
//  BestFood
//
//  Created by Łukasz Andrzejewski on 17/02/2021.
//

import Foundation
import Combine

final class OrderService: ObservableObject {
    
    @Published var entries:[OrderEntryModel] = []
    
    private var subscriptions = Set<AnyCancellable>()

    func add(entry: OrderEntryModel) {
        entries.append(entry)
    }
    
    func remove(entriesWith indexSet: IndexSet){
        entries.remove(atOffsets: indexSet)
    }
    
    func confirm() {
        URLSession.shared.request(for: "http://0.0.0.0:3000/orders", payload: OrderModel(entries: entries))
            .sink(receiveCompletion: { [self] completion in
                switch completion {
                case .finished:
                    entries.removeAll()
                case .failure(let error):
                    print(error)
                }
            }, receiveValue: {})
            .store(in: &subscriptions)
    }
    
}
