//
//  OrderView.swift
//  BestFood
//
//  Created by Łukasz Andrzejewski on 16/02/2021.
//

import SwiftUI

struct OrderView: View {
    
    @ObservedObject var viewModel: OrderViewModel
    @EnvironmentObject var order: OrderService
    
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
                        .onDelete(perform: order.remove(entriesWith:))
                    }
                    Spacer()
                    Button { order.confirm()}
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
                    EmptyView(imageName: "cart", message: "Your order is empty. Add some products.")
                }
            }
        }
    }
    
}

struct OrderView_Previews: PreviewProvider {
    
    static var previews: some View {
        OrderView(viewModel: OrderViewModel())
    }
    
}
