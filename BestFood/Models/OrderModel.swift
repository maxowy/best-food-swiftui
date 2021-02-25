//
//  OrderModel.swift
//  BestFood
//
//  Created by Łukasz Andrzejewski on 17/02/2021.
//

import Foundation

struct OrderModel: Codable {
    
    var entries: [OrderEntryModel]
     
    mutating func add(entry: OrderEntryModel) {
        entries.append(entry)
    }
    
    mutating func remove(entriesWith indexSet: IndexSet){
        entries.remove(atOffsets: indexSet)
    }
    
}
