//
//  LazyImageViewModel.swift
//  BestFood
//
//  Created by Łukasz Andrzejewski on 16/02/2021.
//

import Foundation
import SwiftUI

final class LazyImageViewModel: ObservableObject {
    
    private let imageLoader = ImageLoader()
    
    @Published var image: Image? = nil
    
    init(urlString: String) {
        imageLoader.get(from: urlString) {
            guard let uiImage = $0 else { return }
            DispatchQueue.main.async { [self] in
                image = Image(uiImage: uiImage)
            }
        }
    }
    
}
