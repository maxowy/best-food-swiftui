//
//  ProfileViewModel.swift
//  BestFood
//
//  Created by Łukasz Andrzejewski on 16/02/2021.
//

import Foundation
import Combine

final class ProfileViewModel: ObservableObject {
    
    @Published var firstName = ""
    @Published var lastName = ""
    @Published var email = ""
    @Published var password = ""
    @Published var passwordConfirmation = ""
    @Published var birthday = Date()
    @Published var subscriber = false
    @Published var cardNumber = ""
    @Published var cardCvv = ""
    @Published var cardExpirationDate = Date()
    @Published var isFormValid = false
    
    private var subscriptions = Set<AnyCancellable>()
    
    init() {
        Publishers.CombineLatest3(
            emailIsValid()
            passwordIsValid(),
            passwordMatchesConfirmation
        )
        .debounce(for: .microseconds(500), scheduler: RunLoop.main)
        .map { $0 && $1 && $2}
        .assign(to: &$isFormValid)
    }
    
    private func emailIsValid() -> AnyPublisher<Bool, Never>  {
        $email.map { $0.contains("@") && $0.contains(".") }.eraseToAnyPublisher()
    }
    
    private func passwordIsValid() -> AnyPublisher<Bool, Never> {
        $password.map { $0.count > 6 }.eraseToAnyPublisher()
    }
    
    private var passwordMatchesConfirmation: AnyPublisher<Bool, Never> {
        $password.combineLatest($passwordConfirmation).map { $0 == $1 }.eraseToAnyPublisher()
    }

}
