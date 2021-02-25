//
//  RestaurantsView.swift
//  BestFood
//
//  Created by Łukasz Andrzejewski on 25/02/2021.
//

import SwiftUI

struct RestaurantsView: View {
    
    @ObservedObject var viewModel: RestaurantsViewModel
    
    var body: some View {
        ZStack {
            NavigationView {
                ScrollView {
                    LazyVGrid(columns: [GridItem(), GridItem(), GridItem()]) {
                        ForEach(viewModel.restaurants) { restaurant in
                            NavigationLink(destination: Text("ok")) {
                                VStack {
                                    LazyImageView(urlString: restaurant.imageUrl)
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 110, height: 80)
                                        .cornerRadius(10)
                                    Text(restaurant.name)
                                        .foregroundColor(Color.primary)
                                }
                            }
                        }
                    }
                }
                .navigationTitle("Restaurants")
            }
            if viewModel.isLoading {
                LoadingView()
            }
        }
        .onAppear { viewModel.refresh() }
    }
    
}

struct RestaurantsView_Previews: PreviewProvider {
    
    static var previews: some View {
        RestaurantsView(viewModel: RestaurantsViewModel(restaurantsService: RestaurantService()))
    }
    
}
