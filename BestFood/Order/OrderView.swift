//
//  OrderView.swift
//  BestFood
//
//  Created by Łukasz Andrzejewski on 16/02/2021.
//

import SwiftUI

struct OrderView: View {
    
    @ObservedObject var viewModel: OrderViewModel
    @EnvironmentObject var order: OrderModel
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    List {
                        ForEach(order.entries) { entry in
                            HStack {
                                Text(entry.name)
                                Spacer()
                                Text(viewModel.formatPrice(entry.price))
                            }
                        }
                        .onDelete(perform: order.removeEntry)
                    }
                    Spacer()
                    Button { viewModel.place(order)}
                        label: {
                            Text("Place order \(viewModel.getTotalValue(order: order))")
                                .fontWeight(.bold)
                                .frame(width: 200, height: 40)
                                .foregroundColor(.white)
                                .background(Color.primary)
                        }
                        .cornerRadius(8)
                        .padding()
                }
                .navigationTitle("Order")
                if order.entries.isEmpty {
                    EmptyView(imageName: "cart", message: "No items found")
                }
            }
        }
    }
    
}

struct OrderView_Previews: PreviewProvider {
    
    static var previews: some View {
        OrderView(viewModel: OrderViewModel(foodService: FakeFoodService()))
    }
    
}
