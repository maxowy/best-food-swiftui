//
//  BestFoodTabView.swift
//  BestFood
//
//  Created by Łukasz Andrzejewski on 16/02/2021.
//

import SwiftUI

struct BestFoodTabView: View {
    
    var body: some View {
        TabView {
            FoodListView(viewModel: FoodListViewModel())
                .tabItem {
                    Image(systemName: "list.dash")
                    Text("Food")
                }
            OrderView(viewModel: OrderViewModel())
                .tabItem {
                    Image(systemName: "bag")
                    Text("Order")
                }
            ProfileView()
                .tabItem {
                    Image(systemName: "person")
                    Text("Profile")
                }
        }
        .accentColor(.primary)
    }
    
}

struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        BestFoodTabView()
    }
    
}
