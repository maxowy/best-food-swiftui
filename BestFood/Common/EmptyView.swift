//
//  EmptyView.swift
//  BestFood
//
//  Created by Łukasz Andrzejewski on 16/02/2021.
//

import SwiftUI

struct EmptyView: View {
    
    let imageName: String
    let message: String
    
    var body: some View {
        ZStack {
            Color(.systemBackground)
            VStack {
                Image(systemName: imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 120)
                Text(message)
                    .padding()
            }
        }
    }
    
}

struct EmptyView_Previews: PreviewProvider {
    
    static var previews: some View {
        EmptyView(imageName: "cart", message: "No data")
    }
    
}
