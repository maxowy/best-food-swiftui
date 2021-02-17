//
//  OrderEntryModel.swift
//  BestFood
//
//  Created by Łukasz Andrzejewski on 17/02/2021.
//

import Foundation

struct OrderEntryModel: Identifiable, Codable {
    
    let id: Int
    let name: String
    let price: Double
    
}
