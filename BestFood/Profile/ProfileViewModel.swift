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
    @Published var isValid = false
    
    private var subscriptions = Set<AnyCancellable>()
    
    init() {
        Publishers.CombineLatest(
            $email.map(isEmailValid),
            passwordIsValid().combineLatest(passwordMatchesConfirmation).map { $0 && $1 }
        )
        .debounce(for: .microseconds(500), scheduler: RunLoop.main)
        .map { $0 && $1 }
        .assign(to: &$isValid)
    }
    
    private func isEmailValid(_ email: String) -> Bool {
        email.contains("@") && email.contains(".")
    }
    
    private func isPasswordValid(_ password: String) -> Bool {
        password.count > 6
    }
    
    private func passwordIsValid() -> AnyPublisher<Bool, Never> {
        $password.map(isPasswordValid).eraseToAnyPublisher()
    }
    
    private var passwordMatchesConfirmation: AnyPublisher<Bool, Never> {
        $password.combineLatest($passwordConfirmation)
            .map { $0 == $1 }
            .eraseToAnyPublisher()
    }

}
