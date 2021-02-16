//
//  ActivityIndicatorView.swift
//  BestFood
//
//  Created by Łukasz Andrzejewski on 16/02/2021.
//

import SwiftUI

struct ActivityIndicatorView: UIViewRepresentable {
  
    func makeUIView(context: Context) -> UIActivityIndicatorView {
        let indicator = UIActivityIndicatorView(style: .large)
        indicator.color = .primary
        indicator.startAnimating()
        return indicator
    }
    
    func updateUIView(_ uiView: UIActivityIndicatorView, context: Context) {
    }
    
}
