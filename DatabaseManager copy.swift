//
//  DatabaseManager.swift
//  SweaterShopDemo
//
//  Created by Macbook on 22.08.2022.
//

import Foundation
import FirebaseFirestore

class DatabaseManager {
    
    static let shared = DatabaseManager()
    private let database = Firestore.firestore()
   
    private var clientsRef: CollectionReference {
        return database.collection("visitor")
    }
    
    private init() { }
    
    func setProfile(user: UserModel, completion: @escaping (Result<UserModel, Error>) -> Void) {
        clientsRef.document(user.id).setData(user.representation) { error in
            if let error = error {
                completion(.failure(error))
            } else {
                completion(.success(user))
            }
        }
    }
    
    func getProfile(completion: @escaping (Result<UserModel, Error>) -> Void) {
        clientsRef.document(AuthModel.shared.currentUser!.uid).getDocument { docSnapshot, error in
            
            guard let snap = docSnapshot else { return }
            
            guard let data = snap.data() else { return }
            
            guard let id = data["id"] as? String else { return }
            guard let username = data["name"] as? String else { return }
            guard let email = data["email"] as? String else { return }
            
            let user = UserModel(id: id, name: username, email: email)
            
            completion(.success(user))
        }
    }
}
