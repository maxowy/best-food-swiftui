//
//  OrderModel.swift
//  BestFood
//
//  Created by Łukasz Andrzejewski on 17/02/2021.
//

import Foundation
import Combine

final class OrderModel: ObservableObject {
    
    @Published var entries:[OrderEntryModel] = []
    
    let foodService: FoodService
    
    private var subscriptions = Set<AnyCancellable>()
    
    init(foodService: FoodService) {
        self.foodService = foodService
    }
    
    func addEntry(_ entry: OrderEntryModel) {
        entries.append(entry)
    }
    
    func removeEntry(indexSet: IndexSet){
        entries.remove(atOffsets: indexSet)
    }
    
    func place() {
        foodService.place(order: entries)
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
