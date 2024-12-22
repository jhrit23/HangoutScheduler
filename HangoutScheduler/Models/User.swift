//
//  User.swift
//  HangoutScheduler
//
//  Created by Jonathan Hesler on 12/22/24.
//

import Foundation

struct User {
    private let id: Int
    private var email: String
    private var passwordHash: String
    private var name: String
    
    init(id: Int, email: String, passwordHash: String, name: String) {
        self.id = id
        self.email = email
        self.passwordHash = passwordHash
        self.name = name
    }
}
