//
//  LoginPageModel.swift
//  SweaterShopDemo
//
//  Created by Macbook on 09.11.2022.
//

import SwiftUI

class LoginPageModel: ObservableObject {
    //MARK: - Basics
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var showPassword: Bool = false
    
    //MARK: - Register Properties
    @Published var registerUser: Bool = false
    @Published var re_Enter_Password: String = ""
    @Published var showReEnterPassword: Bool = false

    @AppStorage("log_Status") var log_Status: Bool = false
    
    //MARK: - Login Call
    func Login() {
        withAnimation {
            log_Status = true
        }
    }
    
    func Register() {
        withAnimation {
            log_Status = true
        }
    }
    
    func ForgotPasswor() {
        
    }
}

