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
            Spacer()
            VStack(alignment: .center){
                TextField(
                    "email address",
                    text: $viewModel.email
                )
                .autocapitalization(.none)
                .disableAutocorrection(true)
                .textFieldStyle(OvalTextFieldStyle())
                SecureField(
                    "password",
                    text: $viewModel.password
                )
                .textFieldStyle(OvalTextFieldStyle())
                .disableAutocorrection(true)
            }
            Button {
                viewModel.signUpUser()
            } label: {
                Text("Sign up")
                .frame(maxWidth: .infinity)
            }
            .buttonStyle(.bordered)
            .controlSize(.large)
            Spacer()
        }
        .navigationTitle("Sign Up")
        .padding(20)
    }
}

#Preview {
    SignUpView()
}
