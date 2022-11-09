//
//  LoginPage.swift
//  SweaterShopDemo
//
//  Created by Macbook on 09.11.2022.
//

import SwiftUI

struct LoginPage: View {
    @StateObject var viewModel: LoginPageModel = LoginPageModel()
    @State private var isMainPageShow: Bool = false
    @State private var isShowAlert = false
    @State private var alertMessage = ""

    var body: some View {
        
        VStack {
            
            Text(viewModel.registerUser ? "Well met!" : "Welcome back")
                .font(.largeTitle)
                .foregroundColor(Color("Color2"))
                .fontWeight(.medium)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
            
            ScrollView(.vertical, showsIndicators: false) {
                
                VStack(alignment: .leading, spacing: 15) {
                   Text(viewModel.registerUser ? "Register" : "Login")
                        .font(.title)
                        .foregroundColor(Color("Color1"))
                        .padding(.top, 20)
                    
                    CustomTextField(icon: "envelope", title: "Email", hint: "justine@gmail.com", value: $viewModel.email, showPassword: .constant(false))
                        .padding(.top, 30)
                    
                    CustomTextField(icon: "lock.slash", title: "Password", hint: "12345678", value: $viewModel.password, showPassword: $viewModel.showPassword)
                        .padding(.top, 10)
                    
                    if viewModel.registerUser {
                        CustomTextField(icon: "lock.slash", title: "Re-Enter Password", hint: "12345678", value: $viewModel.re_Enter_Password, showPassword: $viewModel.showReEnterPassword)
                            .padding(.top, 10)
                    }
                    
                    Button {
                        viewModel.ForgotPasswor()
                    } label: {
                        Text("Forgot password?")
                           .font(.callout)
                           .fontWeight(.semibold)
                           .foregroundColor(Color("Color1"))
                   }.padding(.top, 8)
                       .frame(maxWidth: .infinity, alignment: .leading)
                                            
                    Button {
                        if viewModel.registerUser {
                            viewModel.Register()
                            
                            guard viewModel.password == viewModel.re_Enter_Password else {
                                self.alertMessage = "Passwords don't match"
                                self.isShowAlert.toggle()
                                return
                            }
                            AuthModel.shared.signUp(email: self.viewModel.email, password: self.viewModel.password) { result in
                                switch result {
                                case .success(let user):
                                    alertMessage = "You were registered with email \(user.email)"
                                    self.isShowAlert.toggle()
                                    self.viewModel.email = ""
                                    self.viewModel.password = ""
                                    self.viewModel.re_Enter_Password = ""
                                    self.viewModel.registerUser.toggle()
                                case .failure(let error):
                                    alertMessage = "Registration error \n !\(error.localizedDescription)!"
                                    self.isShowAlert.toggle()
                                }
                            }
                        } else {
                            viewModel.Login()
                            AuthModel.shared.login(email: self.viewModel.email, password: self.viewModel.password) { result in
                                switch result {
                                    
                                case .success(let user):
                                    isMainPageShow.toggle()
                                case .failure(let error):
                                    alertMessage = "Login error \n !\(error.localizedDescription)!"
                                    isShowAlert.toggle()
                                }
                            }
                        }
                    } label: {
                        Text(viewModel.registerUser ? "Create account" : "Login")
                           .font(.callout)
                           .padding(.vertical, 20)
                           .frame(maxWidth: .infinity)
                           .foregroundColor(Color("Color2"))
                           .background(Color("Color1"))
                           .cornerRadius(15)
                           .shadow(color: Color.black.opacity(0.07), radius: 5, x: 5, y: 5)
                   }.padding(.top, 25)
                       .padding(.horizontal)
                        
                    Button {
                        withAnimation {
                            viewModel.registerUser.toggle()
                        }
                    } label: {
                        Text(viewModel.registerUser ? "Back to login" : "Create account")
                           .font(.callout)
                           .fontWeight(.semibold)
                           .foregroundColor(Color("Color1"))
                   }.padding(.top, 8)
                    
                }.padding(10)
                
            }.frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color("Color2")
                    .clipShape(CustomCornens(corners: [.topLeft,.topRight], radius: 25))
                    .ignoresSafeArea()
                )
                .alert(alertMessage, isPresented: $isShowAlert) {
                    Button {
                        
                    } label: {
                        Text("OK")
                    }
                }
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color("Color1"))
            
            .onChange(of: viewModel.registerUser) { newValue in
                viewModel.email = ""
                viewModel.password = ""
                viewModel.re_Enter_Password = ""
                viewModel.showPassword = false
                viewModel.showReEnterPassword = false
            }
    }
    @ViewBuilder
    func CustomTextField(icon: String, title: String, hint: String, value: Binding<String>, showPassword: Binding<Bool>) -> some View {
        VStack(alignment: .leading, spacing: 12) {
            Label {
                Text(title)
                    .font(.title3)
            } icon: {
                Image(systemName: icon)

            }.foregroundColor(Color("Color1"))
           
            if title.contains("Password") && !showPassword.wrappedValue {
                SecureField(hint, text: value)
                    .padding(.top, 2)
                    .foregroundColor(Color("Color1"))
            } else {
                TextField(hint, text: value)
                    .padding(.top, 2)
                    .foregroundColor(Color("Color1"))
            }
            
            Divider()
                .background(Color.black.opacity(0.4))
        }.overlay(
            Group {
                if title.contains("Password") {
                    Button(action: {
                        showPassword.wrappedValue.toggle()
                    }, label: {
                        Text(showPassword.wrappedValue ? "Hide" : "Show")
                            .font(.footnote)
                            .foregroundColor(Color.white.opacity(0.5))
                    })
                    .offset(y: 8)
                }
            }, alignment: .trailing
        )
    }
}

struct LoginPage_Previews: PreviewProvider {
    static var previews: some View {
        LoginPage()
    }
}
