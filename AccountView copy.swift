//
//  AccountView.swift
//  LoginPageApplication
//
//  Created by Macbook on 24.11.2022.
//

import SwiftUI

struct AccountView: View {
    
    var body: some View {
            VStack {
                VStack {
                    Spacer()
                    VStack(spacing: 20) {
                        HStack(alignment: .center, spacing: 10) {
                            Image(systemName: "person.fill")
                                .imageScale(.large)
                                .frame(width: 60, height: 60)
                                .background(Color.white.opacity(0.05))
                                .clipShape(Circle())
                                .overlay(Circle().stroke(Color.white.opacity(0.1), lineWidth: 1))
                                .padding(4)
                            
//                            Image(systemName: "person")
//                                .resizable()
//                                .frame(width: 45, height: 45)
//                                .clipShape(Circle())
                               
                           
                            VStack(alignment: .leading, spacing: 5) {
                                Text("Unknow user")
                                    .font(.headline)
                                    .fontWeight(.semibold)
                                Text("unknowuser@gmail.com")
                                    .font(.footnote)
                                    .fontWeight(.medium)
                                    .opacity(0.5)
                            }
                            Spacer()
                            
                        }
                        LoginButton()
                        
                    }
                    .padding(.bottom, 20)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color("DarkGray"))
                    .foregroundColor(Color.white)
                }
                .edgesIgnoringSafeArea(.bottom)
            }
            .navigationBarHidden(true)
    }
}

/*
 var body: some View {
     //NavigationView {
         VStack {
             VStack {
                 Spacer()
                 
                 VStack(spacing: 20) {
                     HStack(alignment: .center, spacing: 10) {
                         Image(systemName: "person")
                             .resizable()
                             .frame(width: 40, height: 40)
                             .padding()
                             .clipShape(Circle())
                            
                         VStack(alignment: .leading, spacing: 5) {
                             Text("Unknow user")
                                 .font(.headline)
                                 .fontWeight(.semibold)
                             Text("unknowuser@gmail.com")
                                 .font(.footnote)
                                 .fontWeight(.medium)
                                 .opacity(0.5)
                         }
                         Spacer()
                         
                     }
                     NavigationLink(destination: LoginPage()) {
                         FullButton(text: "Log In")
                     }
                     
                 }
                 .padding(.bottom, 20)
                 .padding()
                 .frame(maxWidth: .infinity)
                 .background(Color("DarkGray"))
                 .foregroundColor(Color.white)
                 .cornerRadius(15)
             }
             .edgesIgnoringSafeArea(.bottom)
         }
         .navigationBarHidden(true)
     //}
 }
 */

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}

struct FullButton: View {
    var text: String
    var body: some View {
        
        Text(text)
            .font(.system(size: 16, weight: .semibold, design: .default))
            .frame(maxWidth: .infinity)
            .padding()
            .background(Color.white.opacity(0.05))
            .clipShape(RoundedRectangle(cornerRadius: 14, style: .continuous))
            .overlay(RoundedRectangle(cornerRadius: 14, style: .continuous).stroke(Color.white.opacity(0.1), lineWidth: 0.5))
        
    }
}

struct LoginButton: View {
    var body: some View {
        NavigationLink(destination: LoginPage()) {
            FullButton(text: "Log In")
        }
    }
}

