//
//  LoginView.swift
//  CombineDemo
//
//  Created by Khasnobis, Pritha on 14/05/20.
//  Copyright © 2020 Deloitte. All rights reserved.
//

import SwiftUI

struct LoginView: View {
    
    @ObservedObject private var viewModel = LoginViewModel()
    
    var body: some View {
        Form {
            Section {
                Text("Login Form")
                    .bold()
                    .frame(maxWidth: .infinity)
            }
            Section {
                TextField("Username", text: $viewModel.userName)
                    .autocapitalization(.none)

                SecureField("Password", text: $viewModel.password)
            }
            Section {
                Button(action: { }) {
                    Text("LOGIN").bold()
                }
                .disabled(!viewModel.isValid)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
            }.listRowBackground(viewModel.isValid ? Color.green : Color.red)
        }
    }
}

