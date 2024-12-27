//
//  NewHangoutViewViewModel.swift
//  HangoutScheduler
//
//  Created by Jonathan Hesler on 12/27/24.
//

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
        return fieldsEmpty() && validDate()
    }
}
