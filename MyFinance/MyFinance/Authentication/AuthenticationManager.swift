//
//  AuthenticationManager.swift
//  MyFinance
//
//  Created by Sahil Rai on 27/05/2024.
//

import Foundation
import FirebaseAuth

/**
 AuthenticationManager to handle async firebase auth task, utilising singleton design to have one point of authentication access
 */
final class AuthenticationManager: ObservableObject{
    static let shared = AuthenticationManager()
    
    //TODO: Resolve background threading issues 
    @Published var isLoggedIn: Bool {
        didSet {
            UserDefaults.standard.set(isLoggedIn, forKey: "isLoggedIn")
        }
    }
    
    private init(){
        self.isLoggedIn = UserDefaults.standard.bool(forKey: "isLoggedIn")
    }
    
    func createUser(email: String, password: String) async throws -> UserModel {
        let authCreateUserResponse = try await Auth.auth().createUser(withEmail: email, password: password)
        isLoggedIn = false
        return UserModel(user: authCreateUserResponse.user)
    }
    
    func logInUser(email: String, password: String) async throws -> UserModel {
        let authLogInUserResponse = try await Auth.auth().signIn(withEmail: email, password: password)
        isLoggedIn = true
        return UserModel(user: authLogInUserResponse.user)
    }
    
    func logOutUser() throws{
        try Auth.auth().signOut()
        isLoggedIn = false
    }
    
    func getCurrentUser() throws -> UserModel {
        guard let userData = Auth.auth().currentUser else {
            throw URLError(.badURL)
        }
        isLoggedIn = true
        return UserModel(user: userData)
    }
}
