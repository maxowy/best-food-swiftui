//
//  OrderView.swift
//  BestFood
//
//  Created by Łukasz Andrzejewski on 16/02/2021.
//

import SwiftUI

struct OrderView: View {
    
    @ObservedObject var viewModel: OrderViewModel
    @EnvironmentObject var orderService: OrderService
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    List {
                        ForEach(orderService.order.entries) { entry in
                            HStack {
                                Text(entry.name)
                                Spacer()
                                Text(viewModel.formatPrice(entry.price))
                            }
                        }
                        .onDelete { orderService.order.remove(entriesWith: $0) }
                    }
                    Spacer()
                    Button { orderService.confirm()}
                        label: {
                            Text("Place order \(viewModel.getTotalValue(orderService: orderService))")
                                .fontWeight(.bold)
                                .frame(width: 200, height: 40)
                                .foregroundColor(.white)
                                .background(Color.primary)
                        }
                        .cornerRadius(8)
                        .padding()
                }
                .navigationTitle("Order")
                if orderService.order.entries.isEmpty {
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
