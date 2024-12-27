//
//  LoginView.swift
//  HangoutScheduler
//
//  Created by Jonathan Hesler on 12/26/24.
//

import SwiftUI

struct LoginView: View {
    
    @State var name: String = ""
    @State var email: String = ""
    @State var password: String = ""
    
    var body: some View {
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
                            TextField("Email", text: $email)
                                .autocorrectionDisabled()
                                .autocapitalization(.none)
                            SecureField("Password", text: $password)
                            Button(action: {
                                //Register
//                                if !viewModel.fieldsEmpty() || !viewModel.validEmail() {
//                                    viewModel.showInvalidEntryAlert = true
//                                }else{
//                                    viewModel.register()
//                                }
                            }, label: {
                                Text("Login")
                            })
                            .buttonStyle(.borderedProminent)
                            .tint(.blue)
                            .frame(maxWidth: .infinity)
                        }
                        .textFieldStyle(DefaultTextFieldStyle())
                        .frame(height: 200, alignment: .center)
            
                    }
//        .alert(isPresented: $viewModel.showInvalidEntryAlert) {
//            Alert(title: Text("Error"), message: Text("Please ensure all fields have values and a valid email address is entered."))
//        }
                    .offset(y: -150)
    }
}

#Preview {
    LoginView()
}
