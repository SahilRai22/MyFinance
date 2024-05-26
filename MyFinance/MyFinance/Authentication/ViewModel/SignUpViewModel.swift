//
//  SignUpViewModel.swift
//  MyFinance
//
//  Created by Sahil Rai on 22/05/2024.
//

import Foundation
import FirebaseAuth

class SignUpViewModel: ObservableObject {
    @Published var email = "example_test@email.com"
    @Published var password = "password123"
    @Published var user: User? = nil
    @Published var errorMessage: String? = nil
    
    func createUser() {
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            if let error = error {
                self.errorMessage = error.localizedDescription
                print("Error creating user: \(error.localizedDescription)")
            } else {
                self.user = authResult?.user
                print("User created successfully: \(String(describing: self.user))")
            }
        }
    }
}
