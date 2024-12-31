//
//  ManageHangoutsViewViewModel.swift
//  HangoutScheduler
//
//  Created by Jonathan Hesler on 12/28/24.
//

import FirebaseAuth
import FirebaseFirestore
import Foundation

class ManageHangoutsViewViewModel: ObservableObject {
    @Published var showEditHangoutView: Bool = false
    @Published var selectedHangout: Hangout = Hangout(id: "", ownerId: "", name: "", location: "", description: "", hangoutCode: "")
    
    init() {}
    
    func updateSelectedHangout(_ hangout: Hangout) {
        selectedHangout = hangout
    }
    
    func update() {
        
        guard let uId = Auth.auth().currentUser?.uid else { return }
                
        let db = Firestore.firestore()
        
        db.collection("users").document(uId).collection("hangouts").document(selectedHangout.id).setData(selectedHangout.asDictionary())
    }
}
