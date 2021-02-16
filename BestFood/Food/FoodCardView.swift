//
//  FoodCardView.swift
//  BestFood
//
//  Created by Łukasz Andrzejewski on 16/02/2021.
//

import SwiftUI

struct FoodCardView: View {
    
    let viewModel: FoodViewModel
    @Binding var isVisible: Bool
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    
    var body: some View {
        VStack {
            FoodImage(urlString: viewModel.imageUrl)
                .aspectRatio(contentMode: .fit)
                .frame(width: 300, height: 200)
            Text(viewModel.name)
                .font(.title3)
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
            Text(viewModel.description)
                .font(.body)
                .foregroundColor(.gray)
                .lineLimit(1)
            Text(viewModel.priceText)
                .font(.body)
                .fontWeight(.bold)
                .foregroundColor(.primary)
            Button {
                print("Add")
            } label: {
                Text("Add to cart")
                    .fontWeight(.bold)
                    .frame(width: 250, height: 40)
                    .foregroundColor(.white)
                    .background(Color.primary)
            }
            .cornerRadius(8)
            .padding()
        }
        .background(Color(.systemBackground))
        .border(Color.white, width: 1)
        .clipped()
        .shadow(radius: 10)
        .overlay(Button { isVisible = false }
                    label: {
                        ZStack {
                            Circle()
                                .frame(width: 30, height: 30)
                                .foregroundColor(.white)
                                .opacity(0.6)
                            Image(systemName: "xmark")
                                .foregroundColor(.primary)
                                .frame(width: 40, height: 40)
                        }
                        .padding(.all, 6)
                    }, alignment: .topTrailing)
    }
    
}

struct FoodCardView_Previews: PreviewProvider {
    
    static var previews: some View {
        FoodCardView(viewModel: FoodViewModel(id: 1, name: "Asparagus steak", description: "Nice and healthy steak.", price: 120.50, imageUrl: "asparagus-steak"), isVisible: .constant(true))
    }
    
}
