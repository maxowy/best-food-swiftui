//
//  FoodImage.swift
//  BestFood
//
//  Created by Łukasz Andrzejewski on 16/02/2021.
//

import SwiftUI

struct FoodImage: View {
    
    @ObservedObject private var viewModel: RemoteImageViewModel
    
    init(urlString: String) {
        viewModel = RemoteImageViewModel(urlString: urlString)
    }
    
    var body: some View {
        RemoteImageView(image: viewModel.image)
    }
    
}
