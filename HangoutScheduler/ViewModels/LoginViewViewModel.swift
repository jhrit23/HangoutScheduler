//
//  LoginViewViewModel.swift
//  HangoutScheduler
//
//  Created by Jonathan Hesler on 12/26/24.
//

import FirebaseAuth
import Foundation

class LoginViewViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    
    @Published var showInvalidEntryAlert: Bool = false
    
    init() {}
    
    func login() {
        guard fieldsEmpty(), validEmail() else { return }
        Auth.auth().signIn(withEmail: email, password: password)
    }
    
    func fieldsEmpty() -> Bool {
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty, !password.trimmingCharacters(in: .whitespaces).isEmpty else {
                return false
        }
        return true
    }
    
    func validEmail() -> Bool {
        guard email.contains("@"), email.contains(".") else {
            return false
        }
        return true
    }
}
