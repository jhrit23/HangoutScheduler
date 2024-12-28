//
//  Hangout.swift
//  HangoutScheduler
//
//  Created by Jonathan Hesler on 12/26/24.
//

import Foundation

struct Hangout: Codable, Identifiable {
    internal let id: String
    private let ownerId: String
    private var name: String
    private var location: String
    private var description: String
    private var dateTime: TimeInterval
    private var dateSelected: Bool
    private var guests: [User]
    private var activeHangout: Bool
    private var hangoutCode: String
    
    init(id: String, ownerId: String, name: String, location: String, description: String, dateTime: TimeInterval = 1, dateSelected: Bool = true,guests: [User] = [], hangoutCode: String) {
        self.id = id
        self.ownerId = ownerId
        self.name = name
        self.location = location
        self.description = description
        self.dateTime = dateTime
        self.dateSelected = dateSelected
        self.guests = guests
        self.activeHangout = true
        self.hangoutCode = hangoutCode
    }
    
    func getId() -> String {
        return id
    }
    
    func getOwnerId() -> String {
        return ownerId
    }
    
    func getName() -> String {
        return name
    }
    
    mutating func setName(_ name: String) {
        self.name = name
    }
    
    func getLocation() -> String {
        return location
    }
    
    mutating func setLocation(_ location: String) {
        self.location = location
    }
    
    func getDescription() -> String {
        return description
    }
    
    mutating func setDescription(_ description: String) {
        self.description = description
    }
    
    func getDateTime() -> TimeInterval {
        return dateTime
    }
    
    mutating func setDateTime(_ dateTime: TimeInterval) {
        self.dateTime = dateTime
    }
    
    func getGuests() -> [User] {
        return guests
    }
    
    mutating func addGuest(_ guest: User) {
        guests.append(guest)
    }
    
    //Implementation for removing a specific guest is needed
    //Possible implementations could be removing guests
    //by their id, or making an equals method in the user struct
}
