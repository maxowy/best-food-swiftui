//
//  RemoteImageView.swift
//  BestFood
//
//  Created by Łukasz Andrzejewski on 16/02/2021.
//

import SwiftUI

struct RemoteImageView: View {
    
    var image: Image?
    
    var body: some View {
        image?.resizable() ?? Image("placeholder").resizable()
    }
    
}
