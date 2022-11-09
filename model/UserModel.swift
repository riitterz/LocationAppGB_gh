//
//  UserModel.swift
//  SweaterShopDemo
//
//  Created by Macbook on 09.11.2022.
//

import Foundation

struct UserModel: Identifiable {
    
    var id: String 
    var name: String
    var email: String
    
    var representation: [String: Any] {
        var repres = [String: Any]()
        repres["id"] = self.id
        repres["name"] = self.name
        repres["email"] = self.email
        
        return repres
    }
}
