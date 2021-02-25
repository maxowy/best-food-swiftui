//
//  LoginViewModel.swift
//  BestFood
//
//  Created by Łukasz Andrzejewski on 25/02/2021.
//

import Foundation
import Combine

final class LoginViewModel: ObservableObject {
    
    @Published var email = ""
    @Published var password = ""
    @Published var isFromValid = false
    
    init() {
        $email.map { !$0.isEmpty }.combineLatest($password.map { !$0.isEmpty })
            .map { $0 && $1 }
            .assign(to: &$isFromValid)
    }
    
}
