//
//  RegisterViewViewModel.swift
//  HangoutScheduler
//
//  Created by Jonathan Hesler on 12/26/24.
//

import Foundation

class RegisterViewViewModel: ObservableObject {
    @Published var name: String = ""
    @Published var email: String = ""
    @Published var password: String = ""
    
    @Published var showInvalidEntryAlert: Bool = false
    
    init() {}
    
    func fieldsEmpty() -> Bool {
        guard !name.trimmingCharacters(in: .whitespaces).isEmpty, !email.trimmingCharacters(in: .whitespaces).isEmpty, !password.trimmingCharacters(in: .whitespaces).isEmpty else {
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
    
    func register() {
        
    }
}
