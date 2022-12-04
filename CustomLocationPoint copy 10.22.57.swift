//
//  CustomLocationPoint.swift
//  LoginPageApplication
//
//  Created by Macbook on 24.11.2022.
//

import SwiftUI

struct CustomLocationPoint: View {
    var body: some View {
        VStack(alignment: .center, spacing: 4) {
            Image(systemName: "circle")
                .frame(width: 36, height: 36, alignment: .center)
                .foregroundColor(Color.black)
                .clipShape(Circle())
            Text("My Location")
                .font(.footnote)
                .fontWeight(.medium)
                .padding(.horizontal, 8)
                .padding(.vertical, 4)
                .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 8, style: .continuous))
                .overlay(RoundedRectangle(cornerRadius: 8, style: .continuous).stroke(Color.black.opacity(0.1), lineWidth: 1))
        }
    }
}

struct CustomLocationPoint_Previews: PreviewProvider {
    static var previews: some View {
        CustomLocationPoint()
    }
}
