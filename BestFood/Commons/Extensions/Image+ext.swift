//
//  Image+ext.swift
//  BestFood
//
//  Created by Łukasz Andrzejewski on 20/02/2021.
//

import SwiftUI

extension Image {
    
    func icon(width: CGFloat, height: CGFloat) -> some View {
        self.renderingMode(.original)
            .size(width: width, height: width)
    }
    
    func coloredIcon(width: CGFloat, height: CGFloat, color: Color = .white, opacity: Double = 1.0) -> some View {
        self.renderingMode(.template)
            .size(width: width, height: width)
            .foregroundColor(color)
            .opacity(opacity)
    }
    
    private func size(width: CGFloat, height: CGFloat) -> some View {
        self.resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: width, height: height)
    }
    
}
