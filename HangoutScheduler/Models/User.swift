//
//  User.swift
//  HangoutScheduler
//
//  Created by Jonathan Hesler on 12/26/24.
//

import Foundation

struct user {
    private let id: String
    private var name: String
    private var email: String
    private var password: String
    
    init(id: String, name: String, email: String, password: String) {
        self.id = id
        self.name = name
        self.email = email
        self.password = password
    }
    
    func getId() -> String {
        return id
    }
    
    func getName() -> String {
        return name
    }
    
    mutating func setName(_ name: String) {
        self.name = name
    }
    
    func getEmail() -> String {
        return email
    }
    
    mutating func setEmail(_ email: String) {
        self.email = email
    }
    
    func getPassword() -> String {
        return password
    }
    
    mutating func setPassword(_ password: String) {
        self.password = password
    }
}
