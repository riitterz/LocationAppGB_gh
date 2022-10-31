//
//  UberSwiftUIDemoApp.swift
//  UberSwiftUIDemo
//
//  Created by Macbook on 22.09.2022.
//

import SwiftUI

@main
struct UberSwiftUIDemoApp: App {
    @StateObject var locationViewModel = LocationSearchViewModel()
    var body: some Scene {
        WindowGroup {
            HomeView()
                .environmentObject(locationViewModel)
        }
    }
}
