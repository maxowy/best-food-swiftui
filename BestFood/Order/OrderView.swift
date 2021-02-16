//
//  OrderView.swift
//  BestFood
//
//  Created by Łukasz Andrzejewski on 16/02/2021.
//

import SwiftUI

struct OrderView: View {
    
    @ObservedObject var viewModel: OrderViewModel
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    List {
                        ForEach(viewModel.items) { item in
                            HStack {
                                Text(item.name)
                                Spacer()
                                Text(item.priceText)
                            }
                        }
                        .onDelete(perform: viewModel.removeItem)
                    }
                    Spacer()
                    Button { print("Ok") }
                        label: {
                            Text("Place order \(viewModel.totalValue)")
                                .fontWeight(.bold)
                                .frame(width: 200, height: 40)
                                .foregroundColor(.white)
                                .background(Color.primary)
                        }
                        .cornerRadius(8)
                        .padding()
                }
                .navigationTitle("Order")
                if viewModel.items.isEmpty {
                    EmptyView(imageName: "cart", message: "No items found")
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
