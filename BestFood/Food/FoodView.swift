//
//  FoodView.swift
//  BestFood
//
//  Created by Łukasz Andrzejewski on 16/02/2021.
//

import SwiftUI

struct FoodView: View {
    
    let viewModel: FoodViewModel
    
    var body: some View {
        HStack {
            Image(viewModel.imageUrl)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 120, height: 80)
                .cornerRadius(10)
            VStack(alignment: .leading) {
                Text(viewModel.name)
                    .font(.title3)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                Text(viewModel.description)
                    .font(.body)
                    .foregroundColor(.gray)
                    .lineLimit(1)
                Text(viewModel.priceText)
                    .font(.body)
                    .foregroundColor(.primary)
            }
        }
    }
    
}

struct FoodView_Previews: PreviewProvider {
    
    static var previews: some View {
        FoodView(viewModel:  FoodViewModel(id: 1, name: "Asparagus steak", description: "Nice and healthy steak.", price: 120.50, imageUrl: "asparagus-steak"))
    }
    
}
