//
//  MainScreenViewModel.swift
//  LoginPageApplication
//
//  Created by Macbook on 24.11.2022.
//

import Foundation
import FirebaseAuth

class MainScreenViewModel: ObservableObject {
    @Published var user: User
    
    init(user: User) {
        self.user = user
    }
}
