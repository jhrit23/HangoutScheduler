//
//  Hangout.swift
//  HangoutScheduler
//
//  Created by Jonathan Hesler on 12/22/24.
//

import Foundation

struct Hangout {
    private let id: Int
    private let ownerId: Int
    private var name: String
    private var location: String
    private var description: String
    private var dateTime: Date
    private var guests: [User]
    private var activeHangout: Bool
    private var code: String
    
    init(id: Int, ownerId: Int, name: String, location: String, description: String, dateTime: Date, guests: [User], activeHangout: Bool, code: String) {
        self.id = id
        self.ownerId = ownerId
        self.name = name
        self.location = location
        self.description = description
        self.dateTime = dateTime
        self.guests = guests
        self.activeHangout = activeHangout
        self.code = code
    }
}
