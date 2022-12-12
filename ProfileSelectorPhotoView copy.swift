//
//  ProfileSelectorPhotoView.swift
//  LoginPageApplication
//
//  Created by Macbook on 11.12.2022.
//

import SwiftUI

struct ProfileSelectorPhotoView: View {
    @State private var showImagePicker = false
    @State private var selectedImage: UIImage?
    @State private var profileImage: Image?
    @EnvironmentObject var viewModel: LoginPageModel
    
    var body: some View {
        
        VStack {
            Button {
                showImagePicker.toggle()
            } label: {
                if let profileImage = profileImage {
                    profileImage
                        .resizable()
                        .modifier(ProfileImageModefier())
                } else {
                    Image(systemName: "person.fill")
                        .resizable()
                       // .imageScale(.large)
                        .frame(width: 100, height: 100)
                        .background(Color.white.opacity(0.05))
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color.white.opacity(0.1), lineWidth: 1))
                        .padding(4)
                        .modifier(ProfileImageModefier())
                }
            }.sheet(isPresented: $showImagePicker, onDismiss: loadImage) {
                ImagePicker(selectedImage: $selectedImage)
            }.padding(.top, 44)

            if let selectedImage = selectedImage {
                Button {
                    
                } label: {
                    Text("Continue")
                        .font(.headline)
                        .foregroundColor(Color("DarkGray"))
                        .frame(width: 340, height: 50)
                        .background(Color.white.opacity(0.05))
                        .clipShape(Capsule())
                        .padding()
                }.shadow(color: .gray.opacity(0.5), radius: 10, x: 0, y: 0)
            }
        }
    }
    func loadImage() {
        guard let selectedImage = selectedImage else { return }
       
        profileImage = Image(uiImage: selectedImage)
    }
}

private struct ProfileImageModefier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(Color(.systemBlue))
            .scaledToFill()
            .frame(width: 180, height: 180)
            .clipShape(Circle())
    }
}

struct ProfileSelectorPhotoView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileSelectorPhotoView()
    }
}
