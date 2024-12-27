//
//  HomeViewViewModel.swift
//  HangoutScheduler
//
//  Created by Jonathan Hesler on 12/27/24.
//

import FirebaseAuth
import Foundation

class HomeViewViewModel: ObservableObject {
    
    @Published var showNewHangoutView: Bool = false
    
    init() {}
    
    func logout() {
        do {
            try Auth.auth().signOut()
        }catch{
            print(error)
        }
    }
}
