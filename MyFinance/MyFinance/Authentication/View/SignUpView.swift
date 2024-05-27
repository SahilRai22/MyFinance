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
                viewModel.signUpUser()
            } label: {
                Text("Sign up")
            }
        }
        .padding(20)
    }
}

#Preview {
    SignUpView()
}
