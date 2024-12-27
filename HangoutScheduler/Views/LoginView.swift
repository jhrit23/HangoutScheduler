//
//  LoginView.swift
//  HangoutScheduler
//
//  Created by Jonathan Hesler on 12/26/24.
//

import SwiftUI

struct LoginView: View {
    
    @StateObject var viewModel = LoginViewViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                            ZStack {
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(.white)
                                    .border(Color.orange, width: 4)
                                Text("Sign Up Below to Continue!")
                                    .font(.title)
                                    .multilineTextAlignment(.center)
                            }
                            .frame(width: 275, height: 100, alignment: .center)
                            
                            Form {
                                TextField("Email", text: $viewModel.email)
                                    .autocorrectionDisabled()
                                    .autocapitalization(.none)
                                SecureField("Password", text: $viewModel.password)
                                Button(action: {
                                    //Login
                                    if !viewModel.fieldsEmpty() || !viewModel.validEmail() {
                                        viewModel.showInvalidEntryAlert = true
                                    }else{
                                        viewModel.login()
                                    }
                                }, label: {
                                    Text("Login")
                                })
                                .buttonStyle(.borderedProminent)
                                .tint(.blue)
                                .frame(maxWidth: .infinity)
                            }
                            .textFieldStyle(DefaultTextFieldStyle())
                            .frame(height: 200, alignment: .center)
                NavigationLink("Register", destination: RegisterView())
                
                        }
            .alert(isPresented: $viewModel.showInvalidEntryAlert) {
                Alert(title: Text("Error"), message: Text("Please ensure all fields have values and a valid email address is entered."))
            }
                        .offset(y: -150)
        }
    }
}

#Preview {
    LoginView()
}
