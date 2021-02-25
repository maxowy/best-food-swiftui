//
//  UserService.swift
//  BestFood
//
//  Created by Łukasz Andrzejewski on 25/02/2021.
//

import Foundation

final class UserService: ObservableObject {
    
    @Published var isAuthenticated = true
    
    func login(username: String, password: String) {
        
        isAuthenticated = true
    }
    
    func logout() {
        isAuthenticated = false
    }
    
}
