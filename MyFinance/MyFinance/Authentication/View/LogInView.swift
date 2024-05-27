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
                    viewModel.logInUser()
                } label: {
                    Text("Log In")
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
