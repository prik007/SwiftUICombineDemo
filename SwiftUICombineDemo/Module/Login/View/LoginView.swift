//
//  LoginView.swift
//  CombineDemo
//
//  Created by Khasnobis, Pritha on 14/05/20.
//  Copyright © 2020 Deloitte. All rights reserved.
//

import SwiftUI

struct LoginView: View {
    
    var body: some View {
        Form {
            Section {
                Text("Login Form")
                    .bold()
                    .frame(maxWidth: .infinity)
            }
//            Section {
//                TextField("Username", text: $viewModel.username)
//                .autocapitalization(.none)
//                SecureField("Password", text: $viewModel.password)
//            }
            Section {
                Button(action: { }) {
                    Text("LOGIN").bold()
                }
                .foregroundColor(.white)
                .frame(maxWidth: .infinity)
            }.listRowBackground(Color.red)
        }
    }
}

