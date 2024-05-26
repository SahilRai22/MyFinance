//
//  LoginViewModel.swift
//  MyFinance
//
//  Created by Sahil Rai on 26/05/2024.
//

import Foundation
import FirebaseAuth

class LoginViewModel: ObservableObject {
    @Published var email = "example_test@email.com"
    @Published var password = "password123"
    @Published var user: User? = nil
    @Published var errorMessage: String? = nil
    
    func logIn(){
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
//            guard let strongSelf = self else { return }
            
            if let error = error {
                self?.errorMessage = error.localizedDescription
                print("Error logging in user: \(error.localizedDescription)")
            } else {
                self?.user = authResult?.user
                print("User created successfully: \(String(describing: self?.user))")
            }
        }
    }
    
}
