//
//  NewHangoutViewViewModel.swift
//  HangoutScheduler
//
//  Created by Jonathan Hesler on 12/27/24.
//

import FirebaseAuth
import FirebaseFirestore
import Foundation

class NewHangoutViewViewModel: ObservableObject {
    @Published var name: String = ""
    @Published var location: String = ""
    @Published var description: String = ""
    @Published var dateTime: Date = Date()
    @Published var dateSelected: Bool = true
    
    @Published var showAlert: Bool = false
    
    func toggleDateSelected() {
        dateSelected = !dateSelected
    }
    
    private func fieldsEmpty() -> Bool {
        guard !name.trimmingCharacters(in: .whitespaces).isEmpty, !location.trimmingCharacters(in: .whitespaces).isEmpty, !description.trimmingCharacters(in: .whitespaces).isEmpty else {
                return false
        }
        return true
    }
    
    private func validDate() -> Bool {
        guard dateSelected, dateTime >= Date().addingTimeInterval(-86400) else {
            return false
        }
        return true
    }
    
    func validHangout() -> Bool {
        if dateSelected {
            return fieldsEmpty() && validDate()
        }else{
            return fieldsEmpty()
        }
    }
    
    //randomAlphanumericString() found on tutorialspoint.com
    //https://www.tutorialspoint.com/generate-random-alphanumeric-string-in-swift
    func randomAlphanumericString(_ length: Int) -> String {
       let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
       let randomString = (0..<length).map{ _ in String(letters.randomElement()!) }.reduce("", +)
       return randomString
    }
    
    func createHangout() {
        guard validHangout() else { return }
        
        guard let uid = Auth.auth().currentUser?.uid else { return }
        
        let db = Firestore.firestore()
        
        let hangoutId = UUID().uuidString
        let hangoutCode = randomAlphanumericString(8)
        let hangout: Hangout
        
        if dateSelected {
            hangout = Hangout(id: hangoutId, ownerId: uid, name: name, location: location, description: description, dateTime: dateTime.timeIntervalSince1970, dateSelected: dateSelected, hangoutCode: hangoutCode)
        }else{
            hangout = Hangout(id: hangoutId, ownerId: uid, name: name, location: location, description: description, dateSelected: dateSelected, hangoutCode: hangoutCode)
        }
        
        print("Hangout")
        print(hangout)
        
        db.collection("users").document(uid).collection("hangouts").document(hangoutId).setData(hangout.asDictionary())
//        db.collection("users").document(uid).collection("hangouts").document("1").setData(["Test": "Test"])
    }
}
