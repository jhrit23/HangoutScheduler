//
//  RegisterViewViewModel.swift
//  HangoutScheduler
//
//  Created by Jonathan Hesler on 12/26/24.
//

import FirebaseAuth
import FirebaseFirestore
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
    
    private func insertUserRecord(id: String) {
        let user = User(id: id, name: name, email: email, password: password)
        let db = Firestore.firestore()
        db.collection("users").document(id).setData(user.asDictionary())
    }
    
    func register() {
        print("Called 1")
        guard fieldsEmpty(), validEmail() else { return }
        print("Called 2")
        Auth.auth().createUser(withEmail: email, password: password) {[weak self] result, error in
            guard let userId = result?.user.uid else { return }
            self?.insertUserRecord(id: userId)
        }
    }
}
