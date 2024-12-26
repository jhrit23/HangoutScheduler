//
//  RegisterView.swift
//  HangoutScheduler
//
//  Created by Jonathan Hesler on 12/26/24.
//

import SwiftUI

struct RegisterView: View {
    
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
                            TextField("Name", text: $name)
                                .autocorrectionDisabled()
                                .autocapitalization(.none)
                            TextField("Email", text: $email)
                                .autocorrectionDisabled()
                                .autocapitalization(.none)
                            SecureField("Password", text: $password)
                            Button(action: {
                                //Register
                            }, label: {
                                Text("Register")
                            })
                            .buttonStyle(.borderedProminent)
                            .tint(.blue)
                            .frame(maxWidth: .infinity)
                        }
                        .textFieldStyle(DefaultTextFieldStyle())
                        .frame(height: 250, alignment: .center)
            
                    }
                    .offset(y: -150)
    }
}

#Preview {
    RegisterView()
}
