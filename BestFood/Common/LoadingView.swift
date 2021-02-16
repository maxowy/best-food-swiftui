//
//  LoadingView.swift
//  BestFood
//
//  Created by Łukasz Andrzejewski on 16/02/2021.
//

import SwiftUI

struct LoadingView: View {
    
    var body: some View {
        ZStack {
            Color(.systemBackground)
            ActivityIndicatorView()
        }
    }
    
}

struct LoadingView_Previews: PreviewProvider {
    
    static var previews: some View {
        LoadingView()
    }
    
}
