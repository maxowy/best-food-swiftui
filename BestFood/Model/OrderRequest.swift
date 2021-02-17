//
//  OrderRequest.swift
//  BestFood
//
//  Created by Łukasz Andrzejewski on 17/02/2021.
//

import Foundation

struct OrderRequest: Codable {
    
    let entries: [OrderEntryModel]
    
}
