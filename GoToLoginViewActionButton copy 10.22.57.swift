//
//  GoToLoginViewActionButton.swift
//  LoginPageApplication
//
//  Created by Macbook on 24.11.2022.
//

import SwiftUI

struct GoToAccountViewCommandButton: View {
    @Binding var open: Bool
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Button(action: {
                    withAnimation {
                        open = true
                    }
                }) {
                    Image(systemName: "person.fill")
                        .imageScale(.large)
                        .frame(width: 55, height: 55)
                        .background(Color.white.opacity(0.05))
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color.white.opacity(0.1), lineWidth: 1))
                        .padding()
                        .padding(.top, 40)
                        
                }
                
            }
            Spacer()
        }.edgesIgnoringSafeArea(.all)
    }
}

