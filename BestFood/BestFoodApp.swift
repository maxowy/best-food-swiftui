//
//  BestFoodApp.swift
//  BestFood
//
//  Created by Łukasz Andrzejewski on 16/02/2021.
//

import SwiftUI

@main
struct BestFoodApp: App {
    
    var body: some Scene {
        WindowGroup {
            BestFoodTabView().environmentObject(OrderModel())
        }
    }
    
}
