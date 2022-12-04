//
//  CustomCornens.swift
//  SweaterShopDemo
//
//  Created by Macbook on 09.11.2022.
//

import SwiftUI

struct CustomCornens: Shape {
    
    var corners: UIRectCorner
    var radius: CGFloat
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        
        return Path(path.cgPath)
    }
}

