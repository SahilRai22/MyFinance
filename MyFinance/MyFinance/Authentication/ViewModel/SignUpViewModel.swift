//
//  SignUpViewModel.swift
//  MyFinance
//
//  Created by Sahil Rai on 22/05/2024.
//

import Foundation
import FirebaseAuth

class SignUpViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    
    func signUpUser() {
        //TODO: Add error cases for input validation
        Task {
            do {
                let returnedUserData = try await AuthenticationManager.shared.createUser(email: email, password: password)
                 print("Success: \(returnedUserData)")
            }
            catch {
                print("Error: \(error)")
            }
        }
    }
}
