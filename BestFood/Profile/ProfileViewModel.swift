//
//  ProfileViewModel.swift
//  BestFood
//
//  Created by Łukasz Andrzejewski on 16/02/2021.
//

import Foundation

final class ProfileViewModel: ObservableObject {
    
    @Published var firstName = ""
    @Published var lastName = ""
    @Published var email = ""
    @Published var birthday = Date()
    @Published var subscriber = false
    @Published var cardNumber = ""
    @Published var cardCvv = ""
    @Published var cardExpirationDate = Date()
    
}
