//
//  OrderViewModel.swift
//  BestFood
//
//  Created by Łukasz Andrzejewski on 16/02/2021.
//

import Foundation

final class OrderViewModel: ObservableObject {
    
    @Published var items: [FoodViewModel] = [
        FoodViewModel(id: 1, name: "Asparagus steak", description: "Nice and healthy steak.", price: 120.50, imageUrl: "asparagus-steak"),
        FoodViewModel(id: 2, name: "Healthy pizza", description: "Mega pizza.", price: 90, imageUrl: "healthy-pizza")
    ]
    
    var totalValue: String { "\(items.reduce(0) { $0 + $1.price }) zł" }
    
    func removeItem(with indexSet: IndexSet) {
        items.remove(atOffsets: indexSet)
    }
    
}
