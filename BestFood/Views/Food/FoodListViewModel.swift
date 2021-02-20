//
//  FoodListViewModel.swift
//  BestFood
//
//  Created by Łukasz Andrzejewski on 16/02/2021.
//

import Foundation
import Combine

final class FoodListViewModel: ObservableObject {
    
    private let foodService: FoodService
    
    private var subscriptions = Set<AnyCancellable>()
    
    @Published var food: [FoodViewModel] = []
    @Published var isLoading = false
    
    var selectedFood: FoodViewModel?
    
    init(foodService: FoodService = FakeFoodService()) {
        self.foodService = foodService
        refresh()
    }
    
    func refresh() {
        isLoading = true
        foodService.getFood()
            .sink(receiveCompletion: onComplete) { [self] in
                food = $0.map { FoodViewModel(id: $0.id, name: $0.name, description: $0.description, price: $0.price, imageUrl: $0.imageUrl) }
            }
            .store(in: &subscriptions)
    }
    
    private func onComplete(_ completion: Subscribers.Completion<RequestError>) {
        isLoading = false
        if case .failure(let error) = completion {
            print(error)
        }
    }
    
}
