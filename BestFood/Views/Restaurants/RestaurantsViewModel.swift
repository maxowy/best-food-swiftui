//
//  RestaurantsViewModel.swift
//  BestFood
//
//  Created by Łukasz Andrzejewski on 25/02/2021.
//

import Foundation
import Combine

final class RestaurantsViewModel: ObservableObject {
    
    private let restaurantsService: RestaurantService
    
    private var subscriptions = Set<AnyCancellable>()
    
    @Published var restaurants:[RestaurantModel] = []
    @Published var isLoading = false
    
    init(restaurantsService: RestaurantService) {
        self.restaurantsService = restaurantsService
    }
    
    func refresh() {
        isLoading = true
        restaurantsService.getRestaurants()
            .sink(receiveCompletion: onComplete) { self.restaurants = $0 }
            .store(in: &subscriptions)
    }
    
    private func onComplete(_ completion: Subscribers.Completion<RequestError>) {
        isLoading = false
        if case .failure(let error) = completion {
            print(error)
        }
    }
    
}
