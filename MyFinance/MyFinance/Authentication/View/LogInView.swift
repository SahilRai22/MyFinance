//
//  LogInView.swift
//  MyFinance
//
//  Created by Sahil Rai on 06/05/2024.
//

import SwiftUI

import SwiftUI
import FirebaseCore
import FirebaseFirestore
import FirebaseAuth


struct LogInView: View {
    @ObservedObject var viewModel = LoginViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("Log in Home Page")
                
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
                    viewModel.logIn()
                } label: {
                    Text("Log In")
                }
                if let user = viewModel.user {
                   Text("User logged in: \(user.email ?? "No email")")
                       .padding()
                }
                           
                if let errorMessage = viewModel.errorMessage {
                   Text("Error: \(errorMessage)")
                       .foregroundColor(.red)
                       .padding()
                }
                
                NavigationLink("Sign up", value:"sign_up")
            }
            .navigationDestination(for: String.self, destination: { value in
                SignUpView()
            })

        }
        .padding(20)
    }
}

#Preview {
    LogInView()
}
