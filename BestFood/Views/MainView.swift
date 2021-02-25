//
//  MainView.swift
//  BestFood
//
//  Created by Łukasz Andrzejewski on 25/02/2021.
//

import SwiftUI

struct MainView: View {
    
    @EnvironmentObject var userService: UserService
    
    var body: some View {
        if userService.isAuthenticated {
            BestFoodTabView()
        } else {
            LoginView(viewModel: LoginViewModel())
        }
    }
    
}

struct MainView_Previews: PreviewProvider {
    
    static var previews: some View {
        MainView()
    }
    
}
