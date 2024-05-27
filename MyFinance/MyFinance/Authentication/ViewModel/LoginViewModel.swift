//
//  LoginViewModel.swift
//  MyFinance
//
//  Created by Sahil Rai on 26/05/2024.
//

import Foundation
import FirebaseAuth

class LoginViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    
    func logInUser() {
        //TODO: Add error cases for input validation
        Task {
            do {
                let returnedUserData = try await AuthenticationManager.shared.logInUser(email: email, password: password)
                 print("Success: \(returnedUserData)")
            }
            catch {
                print("Error: \(error)")
            }
        }
    }
}
