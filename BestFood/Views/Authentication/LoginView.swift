//
//  LoginView.swift
//  BestFood
//
//  Created by Łukasz Andrzejewski on 25/02/2021.
//

import SwiftUI

struct LoginView: View {
    
    @ObservedObject var viewModel: LoginViewModel
    @EnvironmentObject var userService: UserService
    
    var body: some View {
        VStack {
            Text("Best Food")
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                .foregroundColor(Color.primary)
            Form {
                TextField("Email address", text: $viewModel.email)
                SecureField("Password", text: $viewModel.password)
            }
            Button { userService.login(username: viewModel.email, password: viewModel.password) }
                label: {
                    Text("Login")
                        .fontWeight(.bold)
                        .frame(width: 200, height: 40)
                        .accentColor(Color.primary)
                }
                .cornerRadius(8)
                .padding()
                .disabled(!viewModel.isFromValid)
        }
    }
    
}

struct LoginView_Previews: PreviewProvider {
    
    static var previews: some View {
        LoginView(viewModel: LoginViewModel())
    }
    
}
