//
//  ProfileView.swift
//  BestFood
//
//  Created by Łukasz Andrzejewski on 16/02/2021.
//

import SwiftUI

struct ProfileView: View {
    
    @ObservedObject var viewModel: ProfileViewModel
    @EnvironmentObject var userService: UserService
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Personal info")) {
                    TextField("First name", text: $viewModel.firstName)
                    TextField("Last name", text: $viewModel.lastName)
                    TextField("Email address", text: $viewModel.email)
                        .keyboardType(.emailAddress)
                        .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                        .disableAutocorrection(true)
                    SecureField("Password", text: $viewModel.password)
                    SecureField("Password confirmation", text: $viewModel.passwordConfirmation)
                    DatePicker("Birthday", selection: $viewModel.birthday, displayedComponents: .date)
                    Toggle("Subscriber:", isOn: $viewModel.subscriber)
                        .toggleStyle(SwitchToggleStyle(tint: .primary))
                }
                if !viewModel.isFormValid {
                    Text("Please fill the form corectly")
                        .foregroundColor(.red)
                }
                if viewModel.subscriber {
                    Section(header: Text("Payments info")) {
                        TextField("Card number", text: $viewModel.cardNumber)
                        TextField("CVV", text: $viewModel.cardCvv)
                        DatePicker("Expiration date", selection: $viewModel.cardExpirationDate, displayedComponents: .date)
                    }
                }
            }
            .navigationTitle("Profile")
            .toolbar {
                Button("Wyloguj") { userService.logout() }
            }
        }
        
    }
    
}

struct ProfileView_Previews: PreviewProvider {
    
    static var previews: some View {
        ProfileView(viewModel: ProfileViewModel())
    }
    
}
