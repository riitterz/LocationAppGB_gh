//
//  MainScreenView.swift
//  LoginPageApplication
//
//  Created by Macbook on 24.11.2022.
//

import SwiftUI
import MapKit

let customLocation = [CustomLocation(latilude: 40.7484, longitude: -73.9857)]

struct MainScreenView: View {
    @State private var openLoginView = false
    @State private var location = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 40.7484, longitude:  -73.9857),
                                                     span: MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005))
    @Environment(\.presentationMode) var presentationMode
    
    
//    var viewModel: MainScreenViewModel
    
    var body: some View {
        NavigationView {
            ZStack(alignment: .topTrailing) {
                Map(coordinateRegion: $location, annotationItems: customLocation) { location in
                    MapAnnotation(coordinate: location.coordinate) {
                        CustomLocationPoint()
                    }
                }.ignoresSafeArea()
                
                LinearGradient(gradient: Gradient(colors: [Color("DarkGray"), Color.clear, Color.clear, Color.clear]), startPoint: .top, endPoint: .bottom)
                    .allowsHitTesting(false)
                    .ignoresSafeArea()
                
                GoToAccountViewCommandButton(open: $openLoginView)
                
                if openLoginView {
                    Color.black.opacity(0.5)
                        .edgesIgnoringSafeArea(.all)
                        .transition(.opacity)
                        .onTapGesture {
                            withAnimation {
                                openLoginView = false
                            }
                        }
                }
                
                if openLoginView {
                   AccountView()
                        .zIndex(1)
                        .transition(.move(edge: .bottom))
                }
                

            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color("DarkGray"))
            .foregroundColor(Color.white)
            .navigationBarHidden(true)
        }
    }
}

