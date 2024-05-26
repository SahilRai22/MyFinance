//
//  SignUpView.swift
//  MyFinance
//
//  Created by Sahil Rai on 06/05/2024.
//

import SwiftUI

struct SignUpView: View {
    @ObservedObject var viewModel = SignUpViewModel()
    
    var body: some View {
        VStack {
            Text("Sign Up View")
            
            VStack(alignment: .center){
                TextField(
                    "email address",
                    text: $viewModel.email
                )
                .autocapitalization(.none)
                .disableAutocorrection(true)
                
                SecureField(
                    "password",
                    text: $viewModel.password
                )
            }
            
            Divider()
            
            Button {
                viewModel.createUser()
            } label: {
                Text("Sign up")
            }
            
            if let user = viewModel.user {
               Text("User created: \(user.email ?? "No email")")
                   .padding()
            }
                       
            if let errorMessage = viewModel.errorMessage {
               Text("Error: \(errorMessage)")
                   .foregroundColor(.red)
                   .padding()
            }
        }
        .padding(20)
    }
}

#Preview {
    SignUpView()
}
