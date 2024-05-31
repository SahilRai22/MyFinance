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
               Text("VISUALISE YOUR FINANCE")
                    .font(.subheadline)
                    .bold()
                Spacer()
                
                VStack(alignment: .center){
                    TextField(
                        "email address",
                        text: $viewModel.email
                    )
                    .textFieldStyle(OvalTextFieldStyle())
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
        
                    SecureField(
                        "password",
                        text: $viewModel.password
                    )
                    .textFieldStyle(OvalTextFieldStyle())
                    .disableAutocorrection(true)
                }
                .padding()

                HStack{
                    Button {
                        viewModel.logInUser()
                    } label: {
                        Text("Log In")
                            .frame(maxWidth: .infinity)
                    }
                    .buttonStyle(.bordered)
                    .controlSize(.large)
                    
                    NavigationLink(destination: SignUpView()){
                        Text("Sign Up")
                        .frame(maxWidth: .infinity)
                    }
                    .buttonStyle(.borderedProminent)
                    .controlSize(.large)
                }
                .padding()
                Spacer()
            }
            .navigationTitle("My Finance")
        }
        .padding(20)
    }
}

struct OvalTextFieldStyle: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .padding(15)
            .overlay(
                RoundedRectangle(cornerRadius: 40)
                    .stroke(Color.blue, lineWidth: 2))
    }
}

#Preview {
    LogInView()
}
